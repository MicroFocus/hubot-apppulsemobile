root = exports ? this

root.fundexMockData = {
  "metaData": {
    "message": "string",
    "messageCode": 2000,
    "fromDay": "string",
    "toDay": "string"
  },
  "data": {
    "fundexScorePoints": 60,
    "slowUiPoints": 5,
    "slowLaunchPoints": 0,
    "crashesPoints": 0,
    "errorsPoints": 9,
    "heavyBatteryUsagePoints": 6,
    "heavyCellularUsagePoints": 0
  }
}

root.userActionsResposeMockData = {
  "metaData": {
    "message": "Success",
    "messageCode": 2000,
    "fromDay": "2016-04-01 00:00 UTC",
    "toDay": "2016-04-18 23:59 UTC"
  },
  "data": {
    "userActionList": [
      {
        "actionId": "337329516271221995",
        "screenName": "Money Transfer",
        "actionName": "Tap the 'Transfer' button",
        "controlType": "button",
        "gestureType": "Tap",
        "dailyAvgAffectedUsers": 794,
        "failedActionHitsPercent": 27.43,
        "appVersions": "3.2,3.3,3.5,3.6"
        "appPulseUrl":"http://myd-vm21820.hpswlabs.adapps.hp.com/apmappsServer/index.html?TENANTID=444554562#/reports/stability/errorsOnAction?actionIds=337329516271221995&applicationId=4361e5bf72f343be8f340ba20017774d&appVersion=ALL"
      },
      {
        "actionId": "81088876309325053",
        "screenName": "Brokerage",
        "actionName": "Tap the 'Get stock quotes' button",
        "controlType": "button",
        "gestureType": "Tap",
        "dailyAvgAffectedUsers": 342.22,
        "failedActionHitsPercent": 11.2,
        "appVersions": "3.2,3.3,3.4,3.5,3.6"
        "appPulseUrl":"http://myd-vm21820.hpswlabs.adapps.hp.com/apmappsServer/index.html?TENANTID=444554562#/reports/stability/errorsOnAction?actionIds=337329516271221995&applicationId=4361e5bf72f343be8f340ba20017774d&appVersion=ALL"
      },
      {
        "actionId": "145473219096908992",
        "screenName": "Accounts",
        "actionName": "Select the Money transfer menu item",
        "controlType": "Menu",
        "gestureType": "Tap",
        "dailyAvgAffectedUsers": 131.94,
        "failedActionHitsPercent": 4.02,
        "appVersions": "3.2,3.3,3.5"
        "appPulseUrl":"http://myd-vm21820.hpswlabs.adapps.hp.com/apmappsServer/index.html?TENANTID=444554562#/reports/stability/errorsOnAction?actionIds=337329516271221995&applicationId=4361e5bf72f343be8f340ba20017774d&appVersion=ALL"
      },
      {
        "actionId": "701466228373455393",
        "screenName": "Brokerage",
        "actionName": "Select checkbox 'SP500'",
        "controlType": "CheckBox",
        "gestureType": "Tap",
        "dailyAvgAffectedUsers": 79.44,
        "failedActionHitsPercent": 3.29,
        "appVersions": "3.3,3.5"
        "appPulseUrl":"http://myd-vm21820.hpswlabs.adapps.hp.com/apmappsServer/index.html?TENANTID=444554562#/reports/stability/errorsOnAction?actionIds=337329516271221995&applicationId=4361e5bf72f343be8f340ba20017774d&appVersion=ALL"
      },
      {
        "actionId": "419278562619777047",
        "screenName": "Brokerage",
        "actionName": "Select the Brokerage menu item",
        "controlType": "Menu",
        "gestureType": "Tap",
        "dailyAvgAffectedUsers": 52.39,
        "failedActionHitsPercent": 2,
        "appVersions": "3.2,3.5"
        "appPulseUrl":"http://myd-vm21820.hpswlabs.adapps.hp.com/apmappsServer/index.html?TENANTID=444554562#/reports/stability/errorsOnAction?actionIds=337329516271221995&applicationId=4361e5bf72f343be8f340ba20017774d&appVersion=ALL"
      }
    ]
  }
}

