import './Animation.css'
import './Font.css'
import './Print.css'
import './Root.css'

import { Main } from './Main.elm'

import Icon from './Icon'
import Navigation from './Navigation'
import Print from './Print'
import RegisterServiceWorker from './RegisterServiceWorker'

const node = document.getElementById('root')
const app = Main.embed(node, {
  iconSource: Icon
})

Navigation.subscribe(app)
Print.subscribe(app)

RegisterServiceWorker()
