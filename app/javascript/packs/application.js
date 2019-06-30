/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

function activateMenu () {
  let toggle = document.getElementById('js-navbar-toggle')
  let menu = document.getElementsByClassName('Navbar__navbar-menu')[0]

  toggle.addEventListener('click', toggleMenu)

  function toggleMenu (e) {
    e.preventDefault()
    menu.classList.toggle('Navbar__navbar-menu_opened')
  }
}

function siblingElements (element) {
  return Array.prototype.filter.call(element.parentNode.children, (sibling) => {
    return sibling !== element
  })
}

function favoriteStars () {
  let favoriteStars = document.querySelectorAll('.js-favorite-star')

  favoriteStars.forEach((star) => {
    star.addEventListener('click', async (e) => {
      let token = document.querySelector("meta[name='csrf-token']").getAttribute('content')
      let response = await fetch(e.target.dataset.url, {
        method: e.target.dataset.method,
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
          'X-CSRF-Token': token
        },
        credentials: 'same-origin'
      })

      if (response.status === 200) {
        e.target.style.display = 'none'
        let siblingStar
        let siblingIcons = siblingElements(e.target)
        for (let icon of siblingIcons) {
          if (icon.classList.contains('js-favorite-star')) {
            siblingStar = icon
          }
        }
        siblingStar.style.display = ''
      }
    })
  })
}

document.addEventListener('turbolinks:load', () => {
  activateMenu()
  favoriteStars()
}, false)
