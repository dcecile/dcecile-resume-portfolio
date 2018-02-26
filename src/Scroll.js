export default {
  subscribe(app, hashId) {
    app.ports.initScroll.subscribe(function() {
      const hashElement = document.getElementById(hashId)
      if (hashElement) {
        const alignToTop = true
        hashElement.scrollIntoView(alignToTop)
      }
    })
  }
}
