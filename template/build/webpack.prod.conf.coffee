
path = require "path"
pathEnv = path.resolve(__dirname, "../.env.prod")
require("dotenv").config path: pathEnv

webpack = require "webpack"
merge = require "webpack-merge"
CleanWebpackPlugin = require "clean-webpack-plugin"
WebpackChunkHash = require "webpack-chunk-hash"
ChunkManifestPlugin = require "chunk-manifest-webpack-plugin"
ExtractTextPlugin = require "extract-text-webpack-plugin"
# CopyWebpackPlugin = require "copy-webpack-plugin"
DotenvPlugin = require "dotenv-webpack"

configBase = require "./webpack.base.conf"

filenameJS = "[name]-[chunkhash:16].js"
filenameCSS = "[name]-[contenthash:16].css"

rulesCSS = [
  loader: "css-loader"
  options:
    discardComments:
      removeAll: true
,
  loader: "postcss-loader"
,
  loader: "sass-loader"
  options:
    outputStyle: "compressed"
    includePaths: [path.resolve(__dirname, "../src/styles")]
]

config = merge configBase,
  entry:
    vendor: [
      "./styles/vendor.scss"
      "babel-polyfill"
      "vue"
      "vue-router"

      "bootstrap/js/src/util"
      "bootstrap/js/src/collapse"
      "bootstrap/js/src/modal"
    ]
    app: [
      "./styles/app.scss"
      "./app.coffee"
    ]
  output:
    path: path.resolve(__dirname, "../dist")
    publicPath: "/"
    filename: filenameJS
    chunkFilename: filenameJS
  module: rules: [
    test: /\.vue$/
    loader: "vue-loader"
    options:
      loaders:
        "scss": ExtractTextPlugin.extract(use: rulesCSS)
        "coffee": "babel-loader!coffee-loader"
  ,
    test: /\.scss$/
    use: ExtractTextPlugin.extract(use: rulesCSS)
  ]
  plugins: [
    new CleanWebpackPlugin ["dist"],
      root: path.resolve(__dirname, "..")
      verbose: true
    # new CopyWebpackPlugin [
    #   from: "mocks"
    #   to: "mocks"
    # ]
    new DotenvPlugin path: pathEnv
    new webpack.LoaderOptionsPlugin
      minimize: true
    new ExtractTextPlugin(filenameCSS)
    new webpack.optimize.ModuleConcatenationPlugin()
    new webpack.optimize.UglifyJsPlugin
      compress: warnings: false
      comments: false
    new webpack.optimize.CommonsChunkPlugin
      name: ["vendor", "manifest"]
      minChunks: Infinity
    new webpack.HashedModuleIdsPlugin()
    new WebpackChunkHash()
    new ChunkManifestPlugin
      filename: "chunk-manifest.json"
      manifestVariable: "webpackManifest"
      inlineManifest: false
  ]

module.exports = config
