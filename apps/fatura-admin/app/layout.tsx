import { Syne, Sora } from "next/font/google";
import "./globals.css";
import { ThemeProvider } from "next-themes";

const syne = Syne({ subsets: ["latin"], weight: ["700", "800"] });
const sora = Sora({ subsets: ["latin"], weight: ["400", "600"] });

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="pt-br" suppressHydrationWarning>
      <body className={`${sora.className} ${syne.className}`}>
        <ThemeProvider
          attribute="class"
          defaultTheme="system"
          enableSystem
        >
          {children}
        </ThemeProvider>
      </body>
    </html>
  );
}