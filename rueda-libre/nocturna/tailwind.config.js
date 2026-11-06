/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: 'media',

  content: [
    "./*.html",
    "./src/**/*.{html,js}"
  ],

  theme: {
    extend: {
      colors: {
        'verde-ruta': '#1E7A4F',
        'naranja-pedal': '#F39A2B',
        'azul-noche': '#14213D',
        'crema': '#FAF6EF',
        'gris-asfalto': '#5B6470',
        'amarillo-farol': '#FFD166'
      },

      fontFamily: {
        titulos: ['Montserrat', 'Arial', 'sans-serif'],
        texto: ['Open Sans', 'Arial', 'sans-serif']
      }
    }
  },

  plugins: []
};