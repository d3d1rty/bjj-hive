import { Controller } from "stimulus"
import { siblingElements } from "../packs/utilities"

export default class extends Controller {
  static targets = ['content']

  togglePanelState (e) {
    e.preventDefault()

    let panel = this.contentTarget
    let siblingLink
    let siblingLinks = siblingElements(e.target)

    panel.classList.toggle('SearchPanel__content--opened')
    e.target.style.display = 'none'
    for (let link of siblingLinks) {
      if (link.classList.contains('SearchPanel__toggle')) {
        siblingLink = link
      }
    }
    siblingLink.style.display = ''
  }
}
