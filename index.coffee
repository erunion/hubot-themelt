fs = require 'fs'
path = require 'path'

module.exports = (robot, scripts) ->
  scriptsPath = path.resolve(__dirname, 'src')
  if scripts? and '*' not in scripts
    robot.loadFile(scriptsPath, 'themelt.coffee') if script in scripts
  else
    robot.loadFile(scriptsPath, 'themelt.coffee')
