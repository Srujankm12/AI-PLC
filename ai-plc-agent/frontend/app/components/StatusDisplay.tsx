"use client";

type Status = "idle" | "loading" | "success" | "error";

interface StatusDisplayProps {
  status: Status;
  error?: string;
}

const statusConfig = {
  idle: null,
  loading: {
    bg: "bg-zinc-800 border-zinc-700",
    icon: (
      <span className="h-4 w-4 animate-spin rounded-full border-2 border-indigo-400 border-t-transparent" />
    ),
    label: "Processing your request…",
    text: "text-zinc-300",
  },
  success: {
    bg: "bg-emerald-950 border-emerald-800",
    icon: (
      <svg className="h-4 w-4 text-emerald-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2.5}>
        <path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" />
      </svg>
    ),
    label: "Generation complete",
    text: "text-emerald-300",
  },
  error: {
    bg: "bg-red-950 border-red-800",
    icon: (
      <svg className="h-4 w-4 text-red-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2.5}>
        <path strokeLinecap="round" strokeLinejoin="round" d="M6 18L18 6M6 6l12 12" />
      </svg>
    ),
    label: "",
    text: "text-red-300",
  },
};

export default function StatusDisplay({ status, error }: StatusDisplayProps) {
  const config = statusConfig[status];
  if (!config) return null;

  const label = status === "error" ? (error ?? "Something went wrong") : config.label;

  return (
    <div className={`flex items-center gap-3 rounded-lg border px-4 py-3 text-sm ${config.bg} ${config.text}`}>
      {config.icon}
      <span>{label}</span>
    </div>
  );
}
