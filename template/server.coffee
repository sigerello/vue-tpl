
path = require "path"
express = require "express"
fallback = require "express-history-api-fallback"

require("dotenv").config path: path.resolve(__dirname, "./.env.prod")

root = path.resolve(__dirname, "./dist")
port = process.env.PORT || 5000

app = express()
app.use express.static root
app.use fallback "index.html", root: root

app.listen port, ->
  console.log "Root is #{root}"
  console.log "OAuth proxy mounted on #{oauth_proxy_path}"
  console.log "App listening on port #{port}"
