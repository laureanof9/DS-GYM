import type { Config } from 'tailwindcss';

export default {
  content: ['./src/**/*.{js,ts,jsx,tsx,mdx}'],
  theme: {
    extend: {
      colors: {
        brand: {
          50: '#f4fff7',
          100: '#e7ffe9',
          500: '#22c55e',
          600: '#16a34a',
          700: '#15803d',
          900: '#052e16',
        },
        ink: '#050505',
      },
      boxShadow: {
        soft: '0 20px 45px -20px rgba(0,0,0,0.25)',
      },
    },
  },
  plugins: [],
} satisfies Config;
