import "./globals.css";
import type { Viewport } from "next";

export const viewport: Viewport = {
  width: "device-width",
  themeColor: "black",
};

export const metadata = {
  title: "n4vysh",
  description: "n4vysh's website.",
  icons: {
    icon: "/images/icon.svg",
    apple: "/images/icon.svg",
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
