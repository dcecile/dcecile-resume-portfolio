import './Animation.css'
import './Font.css'
import './Print.css'
import './Root.css'

import { Elm } from './Main.elm'

import Favicon from './Favicon'
import HeadPort from './HeadPort'
import Icon from './Icon'
import Navigation, { getHash } from './Navigation'
import Print from './Print'

const node = document.getElementById('root')
const app = Elm.Main.init({
  node,
  flags: {
    faviconSource: Favicon,
    hash: getHash(),
    iconSource: Icon,
  },
})

HeadPort.subscribe(app)
Navigation.subscribe(app)
Print.subscribe(app)

if ('serviceWorker' in navigator) {
  navigator.serviceWorker.getRegistrations().then((registrations) => {
    for (const registration of registrations) {
      registration.unregister()
    }
  })
}
