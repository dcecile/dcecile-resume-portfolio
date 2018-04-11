function receiveHead(head) {
  setTitle(head.title)
}

function setTitle(title) {
  document.title = title
}

export default {
  subscribe(app) {
    app.ports.sendHead.subscribe(receiveHead)
  }
}
