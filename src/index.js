import './flip.css';
import './main.css';
import { Elm } from './Main.elm';
import registerServiceWorker from './registerServiceWorker';

const e = document.getElementById('root');

Elm.Main.init({ node: document.getElementById('root') });

console.log(e)

registerServiceWorker();