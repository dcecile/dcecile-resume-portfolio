export default {
  subscribe(app) {
    app.ports.initScroll.subscribe(function() {
      const hashId = window.location.hash.substr(1)
      const hashElement = document.getElementById(hashId)
      if (hashElement) {
        const alignToTop = true
        hashElement.scrollIntoView(alignToTop)
      }
    })
  }
}
