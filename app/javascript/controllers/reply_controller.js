import { Controller } from 'stimulus'

export default class extends Controller {
  setReplyTo (e) {
    e.preventDefault()

    let replyToHiddenField = document.getElementById('js-reply-to-hidden')
    replyToHiddenField.setAttribute('value', this.data.get('parent'))
    window.location.href = '#js-comment-reply-form'
  }
}
