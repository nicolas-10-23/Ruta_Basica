/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./*.html"],
  theme: {
    colors: {
      transparent: "transparent",
      white: "#FFFFFF",
      /* Colores del sitio principal (mismos hex que css/styles.css) */
      "verde-ruta": "#1E7A4F",
      "naranja-pedal": "#F39A2B",
      "azul-noche": "#14213D",
      "gris-asfalto": "#5B6470",
      crema: "#FAF6EF",
      /* Campaña: paleta Coolors */
      petroleo: "#006466",
      pino: "#065A60",
      mar: "#0B525B",
      marino: "#144552",
      acero: "#1B3A4B",
      noche: "#212F45",
      medianoche: "#272640",
      ciruela: "#312244",
      uva: "#3E1F47",
      "orquidea-oscuro": "#4D194D",
      "amarillo-farol": "#FFD166",
      menta: "#5EEAD4",
      orquidea: "#F0ABFC",
    },
    extend: {
      fontFamily: {
        titulos: ['"Montserrat"', "Arial", "sans-serif"],
        texto: ['"Open Sans"', "Arial", "sans-serif"],
      },
    },
  },
  plugins: [],
};