AppPulseApi = require "./libs/appPulseMobileApiAdapter.js"
mockData = require "./mockData"

module.exports =
  getAppId:(apps,appName) ->
    for index,value of apps
      if value.applicationName is appName
        return value.applicationId
    return undefined

#############################################################################
  getApplications:(robot,refresh=false) ->

    apps = robot.brain.get 'apps'
    if apps is null or refresh
      robot.logger.debug "Getting apps from server..."
      apps = AppPulseApi.getApps()
      robot.brain.set("apps",apps)

    return apps

#############################################################################
  getApplicationsNamesStr:(appJson) ->
    result = []
    apps = JSON.parse(appJson)

    for index,value of apps.data.applications
      result.push "#{value.applicationName} (#{value.platformType})"

    return result

#############################################################################
  getFundexColoring:(fundexScore)->
    result =[]
    result.color = "good"
    result.colorAlias = "GOOD"

    if fundexScore<85 and fundexScore>=50
      result.color = "warning"
      result.colorAlias ="FAIR"
    else
      result.color = "danger"
      result.colorAlias="POOR"

    return result
#############################################################################
  getLinkForUaDrill:(ua,applicationId)->
    actionId = ua.actionId

    url = "#{AppPulseApi.getSaaSUrl()}/apmappsServer/index.html?TENANTID=#{AppPulseApi.getTenantId()}#/reports/stability/errorsOnAction?actionIds=#{actionId}&applicationId=#{applicationId}&appVersion=ALL"

    console.log "The url is : #{url}"

    return url

  parseAppPulseDrillResult:(appPulseRes)->
    resObj = new Object()
    summeryDetails = appPulseRes.summaryDetails.split "|"
    summeryDetailsObj = new Object()
    summeryDetailsObj.userAction = summeryDetails[0]
    summeryDetailsObj.screen = summeryDetails[1]
    summeryDetailsObj.action = summeryDetails[2]

    console.log "Parsing summery details: #{JSON.stringify(summeryDetailsObj)}"

    resObj.summery = summeryDetailsObj
    resObj.descriptionDetails = appPulseRes.descriptionDetails
    resObj.traceDrillUrls= appPulseRes.traceDrillUrls

    console.log "Parsing apppulse mobile result : #{JSON.stringify(resObj)}"

    return resObj
  generateUniqueTraceReference:()->
    return Math.floor(1000 + Math.random() * 9000)

  findApp:(robot,appName,platform)->
    result = []
    apps = this.getApplications(robot)
    for index,app of apps
      if app.applicationName is appName
        if platform!=undefined
          if app.platformType is platform
            result.push(app)
        else
          result.push(app)

    return result

  getFundex:(robot,appName,platform)->
    useMockData = robot.brain.get 'isMockData'
    apps = this.findApp(robot,appName,platform)
    result = []
    for app in apps
      if useMockData
        fundex = mockData.fundexMockData
      else
        fundex = AppPulseApi.getFundex(app.applicationId)

      fundexContainer = new Object()
      fundexContainer.appName = app.applicationName
      fundexContainer.platform = app.platformType
      fundexContainer.appId = app.applicationId
      fundexContainer.fundex = fundex

      result.push fundexContainer

    return result

  getTopUAWithErrors:(robot,appName,platform)->
    useMockData = robot.brain.get 'isMockData'

    result =[]
    robot.logger.debug "finding app"

    apps = this.findApp(robot,appName,platform)

    for app in apps
      if useMockData
        topUaWithErrors = mockData.userActionsResposeMockData;
      else
        topUaWithErrors = AppPulseApi.getTopUAWithErrors(app.applicationId)

      container = new Object()
      container.appName = app.applicationName
      container.platform = app.platformType
      container.appId = app.applicationId
      container.data = topUaWithErrors

      result.push(container)

    return result
