/**
 * Returns the sibling elements for a given element.
 * @param {HTMLElementObject} element - The element to find siblings for.
 */
export const siblingElements = (element) => {
  return Array.prototype.filter.call(element.parentNode.children, (sibling) => {
    return sibling !== element
  })
}
