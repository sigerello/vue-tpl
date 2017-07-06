
path = require "path"
webpack = require "webpack"
HtmlWebpackPlugin = require "html-webpack-plugin"

filenameAsset = switch process.env.NODE_ENV
  when "production" then "[name]-[hash:16].[ext]"
  when "development" then "[name].[ext]"

config =
  context: path.resolve(__dirname, "../src")
  resolve:
    extensions: [".js", ".json", ".coffee", ".css", ".scss", ".vue"]
    modules: [path.resolve(__dirname, "../src"), "node_modules"]
    alias:
      components: path.resolve(__dirname, "../src/components")
      directives: path.resolve(__dirname, "../src/directives")
      utils: path.resolve(__dirname, "../src/utils")
      assets: path.resolve(__dirname, "../src/assets")
  module: rules: [
    test: /\.js$/
    loader: "babel-loader"
  ,
    test: /\.coffee$/
    use: [
      loader: "babel-loader"
    ,
      loader: "coffee-loader"
    ]
  ,
    test: /\.(png|jpe?g|gif|ico|svg|ttf|eot|woff2?)$/
    loader: "url-loader"
    options:
      name: filenameAsset
      limit: 1000
  ,
    test: /\.pug$/
    use: [
      loader: "html-loader"
      options:
        attrs: ["img:src", "link:href"]
    ,
      loader: "pug-html-loader"
    ]
  ]
  plugins: [
    new webpack.ProvidePlugin
      $: "jquery"
      jQuery: "jquery"
      Tether: "tether"
    new HtmlWebpackPlugin
      template: "./index.pug"
      filename: "./index.html"
      chunksSortMode: "dependency"
      minify:
        quoteCharacter: "\""
  ]

module.exports = config
