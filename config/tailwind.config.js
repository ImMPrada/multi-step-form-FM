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
        'purple': '#483eff',
        'sky-blue': '#bee2fd',
        'dark-blue': '#164aba',
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
      width: {
        '68.5': '17.125rem',
        '112.5': '28.125rem',
        '235': '58.75rem',
      },
      height: {
        '142': '35.5rem',
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
