const { environment } = require('@rails/webpacker')
const webpack = require('webpack');

environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
}));

// Preventing Babel from transpiling NodeModules packages
environment.loaders.delete('nodeModules');
module.exports = environment
