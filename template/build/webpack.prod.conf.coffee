
path = require "path"
webpack = require "webpack"
merge = require "webpack-merge"
# autoprefixer = require "autoprefixer"

CleanWebpackPlugin = require "clean-webpack-plugin"
WebpackChunkHash = require "webpack-chunk-hash"
ChunkManifestPlugin = require "chunk-manifest-webpack-plugin"
ExtractTextPlugin = require "extract-text-webpack-plugin"

configBase = require "./webpack.base.conf.coffee"

filenameJS = "[name]-[chunkhash:16].js"
filenameCSS = "[name]-[contenthash:16].css"

rulesCSS = [
  loader: "css-loader"
  options:
    discardComments:
      removeAll: true
,
  loader: "postcss-loader"
  # options:
  #   plugins: -> [
  #     autoprefixer
  #       browsers: ["last 3 versions"]
  #   ]
,
  loader: "sass-loader"
  options:
    outputStyle: "compressed"
]

config = merge configBase,
  entry:
    vendor: [
      "./vendor.scss"
      "lodash"
      "vue"
      "vue-router"
    ]
    app: [
      "./app.scss"
      "./app.coffee"
    ]
  output:
    path: path.resolve(__dirname, "../dist/public")
    publicPath: ""
    filename: filenameJS
    chunkFilename: filenameJS
  module: rules: [
    test: /\.vue$/
    loader: "vue-loader"
    options:
      loaders:
        "scss": ExtractTextPlugin.extract(use: rulesCSS)
  ,
    test: /\.scss$/
    use: ExtractTextPlugin.extract(use: rulesCSS)
  ]
  plugins: [
    new CleanWebpackPlugin ["dist/public"],
      root: path.resolve(__dirname, "..")
      verbose: true
    new webpack.EnvironmentPlugin(["NODE_ENV"])
    new webpack.optimize.UglifyJsPlugin
      compress: warnings: false
      comments: false
    new ExtractTextPlugin(filenameCSS)
    new webpack.LoaderOptionsPlugin
      minimize: true
    new webpack.optimize.CommonsChunkPlugin
      name: ["vendor", "manifest"]
      minChunks: Infinity
    new webpack.HashedModuleIdsPlugin()
    new WebpackChunkHash()
    new ChunkManifestPlugin
      filename: "chunk-manifest.json"
      manifestVariable: "webpackManifest"
  ]

module.exports = config
