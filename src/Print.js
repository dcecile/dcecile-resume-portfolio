let previousTitle = undefined

window.addEventListener('beforeprint', function () {
  previousTitle = document.title
  document.title = document.head.querySelector('title').dataset.print
})

window.addEventListener('afterprint', function () {
  document.title = previousTitle
})

export default {
  subscribe(app) {
    app.ports.print.subscribe(function () {
      window.print()
    })
  },
}
