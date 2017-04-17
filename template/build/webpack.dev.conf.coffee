
path = require "path"
webpack = require "webpack"
merge = require "webpack-merge"
autoprefixer = require "autoprefixer"

configBase = require "./webpack.base.conf.coffee"

filenameJS = "[name].js"

rulesCSS = [
  loader: "vue-style-loader"
,
  loader: "css-loader"
,
  loader: "postcss-loader"
  options:
    plugins: -> [
      autoprefixer
        browsers: ["last 3 versions"]
    ]
,
  loader: "sass-loader"
]

config = merge configBase,
  entry:
    app: [
      "./vendor.scss"
      "./app.scss"
      "./app.coffee"
    ]
  output:
    publicPath: "/"
    filename: filenameJS
    chunkFilename: filenameJS
  module: rules: [
    test: /\.vue$/
    loader: "vue-loader"
    options:
      loaders:
        "scss": rulesCSS
  ,
    test: /\.scss$/
    use: rulesCSS
  ]
  devServer:
    historyApiFallback: true
    noInfo: true
  performance:
    hints: false
  plugins: [
    new webpack.LoaderOptionsPlugin
      debug: true
    new webpack.NamedModulesPlugin()
  ]

module.exports = config
