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


Helpers = require './helpers'
AppPulseApi = require "./libs/appPulseMobileApiAdapter.js"
mockData = require "./mockData"

module.exports = (robot) ->
  Helpers.setRobot(robot)

  robot.e.registerIntegration({short_desc: 'AppPulse Mobile hubot chatops integration', name: 'apppulse'})

  #robot.respond /apppulse get apps/i, (msg) ->
  robot.e.create {verb:'get',entity:'apps',help: 'Browse registered apps on tenant',type:'respond'},(msg)->

    Helpers.setSharingRoom(robot,msg)
    robot.http("http://localhost:8080/hubot/apppulsemobile/proxy/getApps")
      .get() (err, res, body) ->
        if err or res.statusCode!=200
          msg.reply 'Sorry, there was an error retrieving the applications'
          return

        robot.logger.debug "Res returned : \n" + body

        apps = JSON.parse body

        attachments = []

        for index,value of apps

          console.log "Getting data for : #{value.applicationId}"

          fields =
            color : "#0000FF"
            fields : [
              {
                title: "Application Name"
                value: value.applicationName
                short: true
              },
              {
                title: "Platform"
                value: value.platformType
                short: true
              }
            ]
          attachments.push(fields)


        msgData = {
          channel: msg.message.room
          text: "Applications for tenant #{AppPulseApi.getTenantId()}"
          attachments: attachments
        }

        console.log JSON.stringify(msgData)

        #robot.emit 'slack.attachment', msgData
        Helpers.sendCustomMessage(robot,msgData)
######################################################################################
  #robot.respond /apppulse get fundex for (.*)/i, (msg)->
  robot.e.create {verb:'get',entity:'fundex',
  regex_suffix:{re: "for (.*)", optional: false},
  help: 'Show fundex for specified application and platform',type:'respond',
  example: 'for Advantage Mobile Banking'},(msg)->

    Helpers.setSharingRoom(robot,msg)
    applicationName = msg.match[1]
    robot.logger.debug "Showing fundex for application #{applicationName}"

    robot.http("http://localhost:8080/hubot/apppulsemobile/proxy/getFundex?appName=#{applicationName}")
    .get() (err, res, body) ->

      if err or res.statusCode!=200
        msg.reply "Sorry, there was an error retrieving fundex for *'#{applicationName}'*"
        return

      fundexResponse = JSON.parse(body)

      robot.logger.debug "FunDex response is : " + JSON.stringify(fundexResponse)

      #        if fundexResponse.metaData.messageCode !=2000
      #          msg.reply "No fundex data for application #{applicationName}"
      #          return

      for fundexContainer in fundexResponse
        fundex = fundexContainer.fundex.data

        coloringObj = Helpers.getFundexColoring(fundex.fundexScorePoints)

        uiPreformancePointsLost = fundex.slowUiPoints + fundex.slowLaunchPoints
        stabilityLostPoints = fundex.crashesPoints + fundex.errorsPoints
        resourcesLostPoints = fundex.heavyBatteryUsagePoints + fundex.heavyCellularUsagePoints
        msgData = {
          channel: msg.message.room
          text: "The *FunDex* score of _'#{applicationName}'_ (#{fundexContainer.platform}) app is: *#{coloringObj.colorAlias}* (#{fundex.fundexScorePoints})"
          attachments:[
            {
              color:coloringObj.color
              mrkdwn_in: ["pretext", "text", "fields"]
              fields:[
                {
                  "title":"UI Performance"
                  "value":"#{uiPreformancePointsLost} points lost"
                }
                {
                  "title":"Stability"
                  "value":"#{stabilityLostPoints} points lost"


                }
                {
                  "title":"Resource Utilization"
                  "value":"#{resourcesLostPoints} points lost"
                }
              ]
            }
          ]
        }

        #robot.emit 'slack.attachment', msgData
        Helpers.sendCustomMessage(robot,msgData)
######################################################################################
  #robot.respond /apppulse get errors for (.*)/i, (msg)->
  robot.e.create {verb:'get',entity:'errors',
  regex_suffix:{re: "for (.*)", optional: false},
  help: 'Show top 5 stability errors for specified application and platform',type:'respond',
  example: 'for Advantage Mobile Banking'},(msg)->

    Helpers.setSharingRoom(robot,msg)
    application = msg.match[1]

    robot.logger.debug "apppulse get stability errors for app=#{application}"

    robot.http("http://localhost:8080/hubot/apppulsemobile/proxy/getErrors?appName=#{application}")
    .get() (err, res, body) ->

      if err or res.statusCode!=200
        msg.reply "Sorry, there was an error retrieving the status for application #{application}"
        return

      jsonResponse = JSON.parse(body)

      for value in jsonResponse
        robot.logger.debug "Entered loop #{value}"
        platform = value.platform

        userActionList = value.data.data.userActionList

        robot.logger.debug "Useractions list \n #{JSON.stringify(userActionList)}"

        attachments =[]
        for index,ua of userActionList
          if index >= 5
            break
          #robot.logger.debug "Traversing UA : #{JSON.stringify(ua)}"
          link = ua.appPulseUrl #Helpers.getLinkForUaDrill(ua,appId)
          attachment ={
            mrkdwn_in: ["pretext", "text", "fields"]
            fields: [
              {
                value: "#{Math.round(ua.dailyAvgAffectedUsers)} users experienced errors with _#{ua.actionName} on #{ua.screenName}_ | <#{link}|view error>"
              }
            ],
            "color": "#F35A00"
          }
          attachments.push(attachment)

        msgData = {
          channel: msg.message.room
          text: "Actions with most errors on _'#{application}'_ (#{platform})"
          attachments: attachments
        }

        robot.logger.debug "Constructed message : \n " + JSON.stringify(msgData)

        #robot.emit 'slack.attachment', msgData
        Helpers.sendCustomMessage(robot,msgData)
######################################################################################
  robot.respond /apppulse set mock data (.*)/i, (msg) ->
    mockDataStatus= msg.match[1]
    if mockDataStatus is "enabled"
      robot.brain.set 'isMockData',true
    else if mockDataStatus is "disabled"
      robot.brain.set 'isMockData',false
    else
      msg.reply "Sorry, command not recognized!"
      return

    msg.reply "Mock data status set to : " + mockDataStatus
######################################################################################
  robot.respond /apppulse mock data status/i, (msg) ->
    mockDataStatus = robot.brain.get 'isMockData'
    msg.reply "Mock data status is #{mockDataStatus}"
######################################################################################
  robot.respond /apppulse set share room (.*)/i, (msg) ->
    shareRoom= msg.match[1]
    robot.brain.set "shareRoom",shareRoom
    msg.reply "Share room set to #{shareRoom}"
######################################################################################
  robot.respond /apppulse get share room/i, (msg) ->
    shareRoom= robot.brain.get "shareRoom"
    msg.reply "Share room is #{shareRoom}"

  robot.respond /apppulse set days to substruct (.*)/i, (msg) ->
    days= msg.match[1]
    AppPulseApi.setDaysToSubstract(days)
    msg.reply "Days to subtracting set to #{days}"

  robot.respond /apppulse get days to substruct (.*)/i, (msg) ->
    days = AppPulseApi.getDaysToSubstract()
    msg.reply "Current subtracting #{days} days"
######################################################################################
  robot.respond /apppulse get error instance/i, (msg) ->
    Helpers.setSharingRoom(robot,msg)
    Helpers.shareToRoom(robot)
######################################################################################
  robot.respond /apppulse share to room/i, (msg) ->
    Helpers.shareToRoom(robot)
