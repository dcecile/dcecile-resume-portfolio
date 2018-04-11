function initScroll() {
  const hashTarget = findHashTarget(getHash())
  if (hashTarget) {
    scrollToTop(hashTarget)
  }

  markHistoryVisited()
}

let previousHash = null

function onHashChange(app) {
  const hash = getHash()
  if (hash !== previousHash) {
    app.ports.onHashChange.send(hash)
    previousHash = hash
    if (isHistoryUnvisited()) {
      if (!findHashTarget(hash)) {
        // When navigating to a "virtual" page, scroll to the top
        // (But don't activate this for navigation to real targets
        // or navigation in past history)
        scrollToTop(document.body)
      }

      markHistoryVisited()
    }
  }
}

export function getHash() {
  return window.location.hash.substr(1)
}

function findHashTarget(hash) {
  return document.getElementById(hash)
}

function markHistoryVisited() {
  history.replaceState({ visited: true }, null)
}

function isHistoryUnvisited() {
  return !(window.history.state || {}).visited
}

function scrollToTop(element) {
  const alignToTop = true
  element.scrollIntoView(true)
}

export default {
  subscribe(app) {
    app.ports.initScroll.subscribe(initScroll)

    previousHash = getHash()
    window.addEventListener('popstate', () => onHashChange(app))
  }
}
