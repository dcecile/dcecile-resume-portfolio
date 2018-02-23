import './Animation.css'
import './Font.css'
import './Print.css'
import './Root.css'

import { Main } from './Main.elm'

import icon from './Icon'
import print from './Print'
import registerServiceWorker from './registerServiceWorker'
import scroll from './Scroll'

const node = document.getElementById('root')
const app = Main.embed(node, {
  iconSource: icon
})

print.subscribe(app)
scroll.subscribe(app)

registerServiceWorker()
