module.exports = {
  purge: [
    './src/**/*.html',
  ],
  theme: {
    extend: {},
  },
  variants: {},
  plugins: [
    require('tailwindcss'),
    require('autoprefixer'),
  ],
}
