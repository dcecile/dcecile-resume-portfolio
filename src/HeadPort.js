function receiveHead(faviconElement, head) {
  setTitle(head.title)
  setFavicon(faviconElement, head.favicon)
}

function setTitle(title) {
  document.title = title
}

function setFavicon(faviconElement, favicon) {
  faviconElement.href = favicon
}

function getFaviconElement() {
  return document.head.querySelector('[rel="shortcut icon"]')
}

export default {
  subscribe(app) {
    const faviconElement = getFaviconElement()
    app.ports.sendHead.subscribe((head) => receiveHead(faviconElement, head))
  },
}
