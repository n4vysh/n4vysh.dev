import './globals.css'

export const metadata = {
  title: 'n4vysh',
  description: "n4vysh's website.",
  viewport: {
    width: 'device-width',
  },
  themeColor: 'black',
  icons: {
    icon: '/images/icon.svg',
    apple: '/images/icon.svg',
  },
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  )
}
