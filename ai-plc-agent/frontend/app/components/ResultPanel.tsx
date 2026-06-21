"use client";

import { useState } from "react";

interface ResultPanelProps {
  result: string | null;
  downloadUrl: string | null;
  fileName: string | null;
}

export default function ResultPanel({ result, downloadUrl, fileName }: ResultPanelProps) {
  const [copied, setCopied] = useState(false);

  if (!result) return null;

  function handleCopy() {
    navigator.clipboard.writeText(result!).then(() => {
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    });
  }

  return (
    <div className="flex flex-col gap-4">

      {/* Download banner */}
      {downloadUrl && fileName && (
        <div className="flex items-center justify-between rounded-xl border border-indigo-700 bg-indigo-950 px-5 py-4">
          <div className="flex flex-col gap-0.5">
            <span className="text-sm font-semibold text-indigo-200">PLCnext project ready</span>
            <span className="text-xs text-indigo-400">{fileName}</span>
          </div>
          <a
            href={downloadUrl}
            download={fileName}
            className="flex items-center gap-2 rounded-lg bg-indigo-600 px-4 py-2 text-sm font-semibold text-white transition hover:bg-indigo-500 active:scale-95"
          >
            <svg className="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
            </svg>
            Download .pcwex
          </a>
        </div>
      )}

      {/* JSON AST */}
      <div className="flex flex-col gap-2">
        <div className="flex items-center justify-between">
          <h2 className="text-sm font-semibold text-zinc-300">Generated JSON AST</h2>
          <button
            onClick={handleCopy}
            className="flex items-center gap-1.5 rounded-md border border-zinc-700 bg-zinc-800 px-3 py-1.5 text-xs text-zinc-300 transition hover:border-zinc-500 hover:text-zinc-100 active:scale-95"
          >
            {copied ? (
              <>
                <svg className="h-3.5 w-3.5 text-emerald-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2.5}>
                  <path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" />
                </svg>
                Copied
              </>
            ) : (
              <>
                <svg className="h-3.5 w-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                  <path strokeLinecap="round" strokeLinejoin="round" d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z" />
                </svg>
                Copy
              </>
            )}
          </button>
        </div>

        <pre className="overflow-x-auto rounded-lg border border-zinc-700 bg-zinc-900 p-4 text-xs leading-relaxed text-zinc-200 font-mono whitespace-pre-wrap break-words">
          {result}
        </pre>
      </div>
    </div>
  );
}
