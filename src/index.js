import './Animation.css';
import './Font.css';
import './Print.css';
import './Root.css';

import fiveHundredPx from './Icon/500px.svg';
import github from './Icon/github.svg';
import linkedin from './Icon/linkedin.svg';
import mail from './Icon/mail.svg';
import printer from './Icon/printer.svg';
import stackOverflow from './Icon/stack-overflow.svg';
import twitter from './Icon/twitter.svg';

import { Main } from './Main.elm';

import registerServiceWorker from './registerServiceWorker';

const node = document.getElementById('root');
Main.embed(node, {
  iconSource: {
    fiveHundredPx,
    github,
    linkedin,
    mail,
    printer,
    stackOverflow,
    twitter
  }
});

registerServiceWorker();
