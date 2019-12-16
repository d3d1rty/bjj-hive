import { Controller } from "stimulus"
import { siblingElements } from "../packs/utilities"

export default class extends Controller {
  static targets = ['menu']

  toggleMenuState (e) {
    e.preventDefault()

    this.menuTarget.classList.toggle('Navbar__navbar-menu_opened')
  }
}
