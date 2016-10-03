express = require('express')
bodyParser = require('body-parser')
cookieParser = require('cookie-parser')
path = require 'path'

# Api
api = require './api'

# App
app = express()

app.use bodyParser.json() # to parse json post
app.use cookieParser() # to parse the cookies

app.use '/api', api

# here you can put statis files 
# that will be served "as is" from the root
pathToStaticFolder = __dirname + "/static"

app.use express.static pathToStaticFolder

app.listen(3021)
console.log('Running on http://localhost:' + 3021)
