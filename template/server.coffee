
express = require "express"
fallback = require "express-history-api-fallback"

root = "#{__dirname}/dist"
port = process.env.PORT || 5000

app = express()
app.use express.static root
app.use fallback "index.html", root: root

app.listen port, ->
  console.log "App listening on port #{port}"
