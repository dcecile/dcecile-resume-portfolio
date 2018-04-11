function initScroll() {
  const hashElement = document.getElementById(getHash())
  if (hashElement) {
    const alignToTop = true
    hashElement.scrollIntoView(alignToTop)
  }
}

let previousHash = null

function onHashChange(app) {
  const hash = getHash()
  if (hash !== previousHash) {
    app.ports.onHashChange.send(hash)
    previousHash = hash
  }
}

export function getHash() {
  return window.location.hash.substr(1)
}

export default {
  subscribe(app) {
    app.ports.initScroll.subscribe(initScroll)

    previousHash = getHash()
    window.addEventListener('popstate', () => onHashChange(app))
  }
}
