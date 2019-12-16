import { Controller } from "stimulus"
import { siblingElements } from "../packs/utilities"

export default class extends Controller {
  static targets = ['toggle']

  async toggleFavorite(e) {
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
  }
}
