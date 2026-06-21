"use client";

import { useState } from "react";

interface ResultPanelProps {
  result: string | null;
  downloadUrl: string | null;
  fileName: string | null;
}

export default function ResultPanel({ result, downloadUrl, fileName }: ResultPanelProps) {
  const [copied, setCopied] = useState(false);
  const [downloading, setDownloading] = useState(false);

  if (!result) return null;

  function handleCopy() {
    navigator.clipboard.writeText(result!).then(() => {
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    });
  }

  async function handleDownload() {
    if (!downloadUrl || !fileName) return;
    setDownloading(true);
    try {
      const res = await fetch(downloadUrl);
      const blob = await res.blob();

      // Use File System Access API when available — shows a proper Save dialog
      // that respects our .pcwex type instead of defaulting to "Compressed Folder"
      if (typeof window !== 'undefined' && 'showSaveFilePicker' in window) {
        try {
          const fileHandle = await (window as any).showSaveFilePicker({
            suggestedName: fileName,
            types: [{ description: 'PLCnext Project', accept: { 'application/x-pcwex': ['.pcwex'] } }],
          });
          const writable = await fileHandle.createWritable();
          await writable.write(blob);
          await writable.close();
          return;
        } catch (e: any) {
          if (e?.name === 'AbortError') return;
          // fall through to Blob URL fallback
        }
      }

      // Fallback: Blob URL — works without dialog when Chrome's
      // "Ask where to save" is OFF (file saves directly to Downloads as .pcwex)
      const url = URL.createObjectURL(new Blob([blob], { type: 'application/x-pcwex' }));
      const a = document.createElement('a');
      a.href = url;
      a.download = fileName;
      document.body.appendChild(a);
      a.click();
      document.body.removeChild(a);
      URL.revokeObjectURL(url);
    } finally {
      setDownloading(false);
    }
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
          <button
            onClick={handleDownload}
            disabled={downloading}
            className="flex items-center gap-2 rounded-lg bg-indigo-600 px-4 py-2 text-sm font-semibold text-white transition hover:bg-indigo-500 active:scale-95 disabled:opacity-60"
          >
            <svg className="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
            </svg>
            {downloading ? 'Downloading…' : 'Download .pcwex'}
          </button>
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
