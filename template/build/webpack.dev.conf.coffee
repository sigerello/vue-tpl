
path = require "path"
webpack = require "webpack"
merge = require "webpack-merge"
DotenvPlugin = require "dotenv-webpack"

pathEnv = path.resolve(__dirname, "../.env.dev")
require("dotenv").config path: pathEnv

configBase = require "./webpack.base.conf.coffee"

filenameJS = "[name].js"

rulesCSS = [
  loader: "vue-style-loader"
,
  loader: "css-loader"
,
  loader: "postcss-loader"
,
  loader: "sass-loader"
  options:
    includePaths: [path.resolve(__dirname, "../src/styles")]
]

config = merge configBase,
  entry:
    app: [
      "./styles/vendor.scss"
      "./styles/app.scss"
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
        "coffee": "babel-loader!coffee-loader"
  ,
    test: /\.scss$/
    use: rulesCSS
  ]
  devServer:
    host: process.env.HOST
    port: process.env.PORT
    disableHostCheck: true
    historyApiFallback: true
    noInfo: true
    contentBase: path.resolve(__dirname, "../src")
  performance:
    hints: false
  plugins: [
    new webpack.LoaderOptionsPlugin
      debug: true
    new webpack.NamedModulesPlugin()
    new DotenvPlugin path: pathEnv
  ]

module.exports = config
