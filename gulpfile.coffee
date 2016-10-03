gulp = require('gulp')
server = require('gulp-develop-server')
run = require('gulp-run')

options =
	server:
		path: 'src/server.coffee'

gulp.task 'server:start', ->
	server.listen options.server, (error) ->
		if error
			console.log "Error at starting node server::"
			console.log error

# If server side coffee files change,
# restart the server.
gulp.task 'server:restart', ->
	server.restart()

gulp.task 'watchServer', ['server:start'], ->
	gulp.watch 'src/**/*.coffee', ['server:restart']

