Helpers = require './helpers'

module.exports = (robot) ->
# the expected value of :room is going to vary by adapter, it might be a numeric id, name, token, or some other value

  robot.router.all '/*', (req, res, next) ->
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "X-Requested-With")
    res.header("Access-Control-Allow-Methods", "GET,PUT,POST,DELETE")
    res.header("Access-Control-Allow-Headers", "Content-Type, Authorization")
    next()
######################################################################################
  robot.router.post '/hubot/apppulsemobile/:room', (req, res) ->
    robot.logger.info "entered listener"
    #room   = req.params.room
    room = robot.brain.get "shareRoom"
    if not room
      room = process.env.SAAS_PREFIX;

    robot.logger.info "Share room defined to be : #{room}"

    data   = req.body

    mobileTraceDrillMap =robot.brain.get 'mobileTraceDrillMap'
    if !mobileTraceDrillMap
      robot.logger.debug "traceDrillmap not initized!"
      mobileTraceDrillMap = new Object()


    robot.logger.debug "Recieved body from apppulse : \n#{JSON.stringify(data)}"

    apppulseShareObj = data

    attachments = []
    for netErr in apppulseShareObj.errorsNetwork
      traceRef = Helpers.generateUniqueTraceReference()
      traceDrillUrl = ""

      if netErr.traceDrillUrl!=null
        traceDrillUrl = netErr.traceDrillUrl
        mobileTraceDrillMap[traceRef]=traceDrillUrl
        robot.brain.set 'mobileTraceDrillMap',mobileTraceDrillMap

      robot.logger.debug "netError json : #{JSON.stringify(netErr)}"
      robot.logger.debug "netError url: #{netErr.url}"
      url = netErr.url.replace("http://","")

      attachment = {
        mrkdwn_in: ["pretext", "text", "fields"]
        color: "#F35A00"
        fields:[
          {
            value: "*Error response code* : #{netErr.errorCode} | *Request*://#{url}"
          }
        ]
      }
      if traceDrillUrl!=""
        attachment.fields.push(
          {
            value: "<#{traceDrillUrl}|Investigate server error> (Transaction uid: #{traceRef})"
          }
        )
      attachments.push attachment

    errorMessage=""
    if apppulseShareObj.errorsMessages.length>0
      errorMessage=apppulseShareObj.errorsMessages[0].message
    msgData = {
      channel: room
      text:"*Failure time*: #{apppulseShareObj.crashTime}\n
            *Action*: #{apppulseShareObj.action} on #{apppulseShareObj.screen}\n
            *Error messsage*: #{errorMessage}\n
            *Failed HTTP Requests*:\n
            "
      attachments: attachments
    }

    robot.logger.debug "Message sent to slack : \n #{JSON.stringify(msgData)}"

    robot.adapter.customMessage msgData

    robot.logger.debug "TraceRef = #{traceRef} with url #{mobileTraceDrillMap[traceRef]}"

    res.send 'OK'
