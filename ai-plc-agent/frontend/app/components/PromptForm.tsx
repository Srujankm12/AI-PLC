"use client";

interface PromptFormProps {
  onSubmit: (prompt: string) => void;
  loading: boolean;
}

export default function PromptForm({ onSubmit, loading }: PromptFormProps) {
  function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    const form = e.currentTarget;
    const prompt = (form.elements.namedItem("prompt") as HTMLTextAreaElement).value.trim();
    if (prompt) onSubmit(prompt);
  }

  return (
    <form onSubmit={handleSubmit} className="flex flex-col gap-4">
      <div className="flex flex-col gap-2">
        <label htmlFor="prompt" className="text-sm font-medium text-zinc-300">
          Describe your PLC logic
        </label>
        <textarea
          id="prompt"
          name="prompt"
          rows={6}
          disabled={loading}
          placeholder="e.g. When push button PB1 is pressed, motor M1 starts and runs for 10 seconds, then stops automatically..."
          className="w-full resize-none rounded-lg border border-zinc-700 bg-zinc-900 px-4 py-3 text-sm text-zinc-100 placeholder-zinc-500 outline-none transition focus:border-indigo-500 focus:ring-1 focus:ring-indigo-500 disabled:opacity-50"
        />
      </div>

      <button
        type="submit"
        disabled={loading}
        className="flex items-center justify-center gap-2 rounded-lg bg-indigo-600 px-6 py-3 text-sm font-semibold text-white transition hover:bg-indigo-500 active:scale-95 disabled:cursor-not-allowed disabled:opacity-50"
      >
        {loading ? (
          <>
            <span className="h-4 w-4 animate-spin rounded-full border-2 border-white border-t-transparent" />
            Generating…
          </>
        ) : (
          "Generate PLC Code"
        )}
      </button>
    </form>
  );
}
