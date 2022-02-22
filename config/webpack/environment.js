const { environment } = require('@rails/webpacker')
// Tvoz added  in according to: https://github.com/rails/webpacker/blob/5-x-stable/docs/webpack.md
const customConfig = require('./custom')
// const merge = require('webpack-merge')    Needs webpack merge first, called if need it 
const url = require('./loaders/url')

// loaders

environment.loaders.prepend('url', url)



// Set nested object prop using path notation
environment.config.set('resolve.extensions', ['.foo', '.bar'])
environment.config.set('output.filename', '[name].js')

// Merge custom config
environment.config.merge(customConfig)
environment.config.merge({ devtool: 'none' })

// Delete a property
environment.config.delete('output.chunkFilename')


//  For access  to configs within Webpacker's configuration, you can import them like so:
const { config } = require('@rails/webpacker')
console.log(config.output_path)
console.log(config.source_path)
// 

// Overriding Loader Options in webpack 3+ (for CSS Modules etc.)
// const myCssLoaderOptions = {
//   modules: {
//     localIdentName: '[name]__[local]___[hash:base64:5]'
//   },
//   sourceMap: true,
// }

// const CSSLoader = environment.loaders.get('sass').use.find(el => el.loader === 'css-loader')

// CSSLoader.options = merge(CSSLoader.options, myCssLoaderOptions)
// 





module.exports = environment
