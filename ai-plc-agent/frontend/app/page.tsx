"use client";

import { useState } from "react";
import axios from "axios";
import PromptForm from "./components/PromptForm";
import StatusDisplay from "./components/StatusDisplay";
import ResultPanel from "./components/ResultPanel";

type Status = "idle" | "loading" | "success" | "error";

const API_URL = process.env.NEXT_PUBLIC_API_URL ?? "http://localhost:3001";

export default function Home() {
  const [status, setStatus] = useState<Status>("idle");
  const [result, setResult] = useState<string | null>(null);
  const [error, setError] = useState<string | undefined>();

  async function handleSubmit(prompt: string) {
    setStatus("loading");
    setResult(null);
    setError(undefined);

    try {
      const { data } = await axios.post(`${API_URL}/api/plc/generate`, { prompt });
      setResult(typeof data === "string" ? data : JSON.stringify(data, null, 2));
      setStatus("success");
    } catch (err) {
      const message =
        axios.isAxiosError(err)
          ? (err.response?.data?.message ?? err.message)
          : "Unexpected error occurred";
      setError(message);
      setStatus("error");
    }
  }

  return (
    <div className="mx-auto flex min-h-screen max-w-3xl flex-col px-4 py-12">
      <header className="mb-10 flex flex-col gap-1">
        <div className="flex items-center gap-2">
          <span className="flex h-8 w-8 items-center justify-center rounded-lg bg-indigo-600 text-sm font-bold text-white">
            P
          </span>
          <h1 className="text-xl font-semibold text-zinc-100">AI PLC Agent</h1>
        </div>
        <p className="text-sm text-zinc-500">
          Describe your control logic in plain English — get IEC 61131-3 ladder code instantly.
        </p>
      </header>

      <main className="flex flex-col gap-6">
        <div className="rounded-xl border border-zinc-800 bg-zinc-900 p-6">
          <PromptForm onSubmit={handleSubmit} loading={status === "loading"} />
        </div>

        {status !== "idle" && (
          <StatusDisplay status={status} error={error} />
        )}

        <ResultPanel result={result} />
      </main>

      <footer className="mt-auto pt-12 text-center text-xs text-zinc-600">
        AI PLC Agent — powered by Claude
      </footer>
    </div>
  );
}
