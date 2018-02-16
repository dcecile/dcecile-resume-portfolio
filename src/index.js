import './Animation.css';
import './Font.css';
import './Print.css';
import './Root.css';
import { Main } from './Main.elm';
import registerServiceWorker from './registerServiceWorker';

Main.embed(document.getElementById('root'));

registerServiceWorker();
