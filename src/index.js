import './Animation.css'
import './Font.css'
import './Print.css'
import './Root.css'

import { Main } from './Main.elm'

import Favicon from './Favicon'
import HeadPort from './HeadPort'
import Icon from './Icon'
import Navigation, { getHash } from './Navigation'
import Print from './Print'
import RegisterServiceWorker from './RegisterServiceWorker'

const node = document.getElementById('root')
const app = Main.embed(node, {
  faviconSource: Favicon,
  hash: getHash(),
  iconSource: Icon
})

HeadPort.subscribe(app)
Navigation.subscribe(app)
Print.subscribe(app)

RegisterServiceWorker()
