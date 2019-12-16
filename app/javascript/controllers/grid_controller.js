import { Controller } from 'stimulus'
import Masonry from 'masonry-layout'

export default class extends Controller {
  connect () {
    /* eslint no-unused-vars: ["error", { "varsIgnorePattern": "[iI]gnored" }] */
    let msnryIgnored = new Masonry('.Grid', {
      columnWidth: '.Grid__sizer',
      gutter: '.Grid__gutterSizer',
      itemSelector: '.Grid__item',
      percentPosition: true
    })
  }
}
