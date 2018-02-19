export default {
  subscribe(app) {
    app.ports.print.subscribe(function() {
      window.print()
    })
  }
}
