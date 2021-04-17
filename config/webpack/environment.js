const { environment } = require('@rails/webpacker')


// jQueryを管理下に追加するため
const webpack = require('webpack')

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    jquery: 'jquery/src/jquery',
  })
)

// jQueryを直接使用するときのため(bootstrap導入)
// const webpack = require('webpack')
// environment.plugins.append('Provide', new webpack.ProvidePlugin({
//     $: 'jquery',
//     jQuery: 'jquery'
// }))

module.exports = environment
