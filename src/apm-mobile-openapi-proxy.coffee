###
Copyright 2016 Hewlett-Packard Development Company, L.P.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
Software distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License. 
###


AppPulseApi = require './libs/appPulseMobileApiAdapter.js'
Helpers = require './helpers'
querystring = require "querystring"
mockData = require "./mockData"

url = require('url')

module.exports = (robot) ->
  robot.router.get '/hubot/apppulsemobile/proxy/getApps', (req, res) ->
    try
      query = querystring.parse(url.parse(req.url).query)
      robot.logger.debug "Getting apps... refresh=#{query.refresh}"

      apps = Helpers.getApplications(robot,query.refresh)
      res.send apps
    catch error
      robot.logger.error "Error getting apps : \n #{error}"
      res.status(500).send "Error retrieving apps"

######################################################################################
  robot.router.get '/hubot/apppulsemobile/proxy/getFundex/:appId', (req, res) ->
    res = AppPulseApi.getFundex(req.params.appId)
    res.send res

######################################################################################
  robot.router.get '/hubot/apppulsemobile/proxy/getFundex', (req, res) ->    
    query = querystring.parse(url.parse(req.url).query)
    appName = query.appName
    platform= query.platform

    robot.logger.debug "Searching fundex for app=#{appName} on platform=#{platform}"

    try      
      fundex = Helpers.getFundex(robot,appName,platform)
      res.send fundex
    catch error
      robot.logger.error "Error getting fundex status for app #{appName}: \n #{error}"
      res.status(500).send "Error getting fundex status for app #{appName}"


######################################################################################
  robot.router.get '/hubot/apppulsemobile/proxy/getErrors', (req, res) ->
    try
      query = querystring.parse(url.parse(req.url).query)
      appName = query.appName
      platform= query.platform

      robot.logger.debug "Searching top ua with errors for app=#{appName} on platform=#{platform}"

      topUaWithError = Helpers.getTopUAWithErrors(robot,appName,platform)

      res.send topUaWithError
    catch error
      robot.logger.error "Error getting stability status for app #{appName}: \n #{error}"
      res.status(500).send "Error getting stability status for app #{appName}"


