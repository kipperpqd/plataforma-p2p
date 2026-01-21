/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: 'class', // <--- Isso permite que o next-themes controle o tema
  content: [
    './app/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}