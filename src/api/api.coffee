express = require('express')
_ = require 'lodash'

api = express.Router()

###
	parsing JSON body
###
api.use (req, res, next) ->
	if req.body
		if Object::toString.call(req.body) isnt '[object Object]'
			req.body = JSON.parse req.body
		next()

	else
		throw new Error "POST data missing"

###
	root cannot be opened
###
api.get '/', (req, res) ->
	res.send "api root"

###
	you can extend this
###
api.use '/:library/:method',(req, res, next) ->
	# req.params contains library, and method

	library = req.params.library
	method = req.params.method

	res.send("You called #{library}/#{method}")


# exception handler within /api/
api.use (err, req, res, next) ->
	res.status(500).json
		success: false
		msg: err.toString()
	console.log "API error"
	console.log err.stack

module.exports = api

