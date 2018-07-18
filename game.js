import * as states from './views/index.js';
import * as Library from '../phaser-library/index.js';
import config from './config/config.js';
import AssetManifest from './AssetManifest.js'
// import WebFont from 'webfontloader'

var height_to_width_ratio = window.innerHeight/window.innerWidth;
if(height_to_width_ratio > 1) {
  height_to_width_ratio = 1/height_to_width_ratio;
}

var GAME = new Phaser.Game(config.gameWidth, config.gameWidth*height_to_width_ratio, Phaser.AUTO);

Object.keys(states).forEach(state => GAME.state.add(state, states[state]));


GAME.state.add('Boot',new Library.Initialize.Boot({
	config :config,
}));

GAME.state.add('Preload',new Library.Initialize.Preload({
	assetManifest : AssetManifest,
	startScreen: config.startScreen,
}));

GAME.state.start('Boot');

window.EVENTS = new Library.Models.Event();

window.GAME = GAME;
window.gameWidth = config.gameWidth;
window.gameHeight = config.gameHeight;

window.OUTDATA = new Library.Utilities.PublishData();






