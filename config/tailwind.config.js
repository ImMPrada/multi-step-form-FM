const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        'dark': '#022959',
        'dark-white': '#f8f9ff',
        'soft-gray': '#9699aa',
        'purple': '#483eff'
      },
      fontSize: {
        'base': [
          '1rem',
          {
            lineHeight: '1.125',
          },
        ],
        'sm': [
          '0.875rem',
          {
            lineHeight: '1.15',
          },
        ],
        'sm': [
          '0.75rem',
          {
            lineHeight: '1.15',
          },
        ],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
