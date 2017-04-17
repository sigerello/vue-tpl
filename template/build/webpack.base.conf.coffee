
path = require "path"
HtmlWebpackPlugin = require "html-webpack-plugin"

filenameAsset = switch process.env.NODE_ENV
  when "production" then "[name]-[hash:16].[ext]"
  when "development" then "[name].[ext]"

config =
  context: path.resolve(__dirname, "../src")
  resolve:
    extensions: [".js", ".json", ".coffee", ".css", ".scss"]
    modules: [path.resolve(__dirname, "../src"), "node_modules"]
  module: rules: [
    test: /\.js$/
    loader: "babel-loader"
    exclude: /node_modules/
  ,
    test: /\.coffee$/
    loader: "coffee-loader"
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
    new HtmlWebpackPlugin
      template: "./index.pug"
      chunksSortMode: "dependency"
  ]

module.exports = config
