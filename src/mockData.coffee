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


root = exports ? this
root.appsMockData={
  "metaData": {
    "message": "Success",
    "messageCode": 2000
  },
  "data": {
    "applications": [
      {
        "applicationId": "8e9d889a88ce42b7ad414427efd3ffc3",
        "applicationName": "Advantage Mobile Banking",
        "platformType": "Android",
        "packageName": "com.hpswdemo.advantageinc",
        "launchTimeThresholdSec": 4,
        "actionResponseTimeThresholdSec": 2,
        "batteryUsageThresholdPercentPerMinute": 0.5,
        "cellularDataUsageThresholdKilobytePerMinute": 300
      }
    ]
  }
}

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

root.shareDataMock = {
  "screen": "Money Transfer",
  "action": "Tap the Transfer button",
  "crashTime": "2016-05-21 18:15:00",
  "autoLink": "http://localhost:3000/index.dev.html?TENANTID=123456#/reports/stability/err…02&applicationId=407aa4ce05f58da322c6e1e2f883d111&appVersion=ALL&mock=test",
  "overviewData": [
    {
      "name": "App Version",
      "value": "v2.3",
      "$$hashKey": "object:692"
    },
    {
      "name": "OS",
      "value": "4.2.2",
      "$$hashKey": "object:693"
    },
    {
      "name": "Device",
      "value": "Galaxy 2",
      "$$hashKey": "object:694"
    }
  ],
  "errorsMessages": [
    {
      "errorTimestamp": 1392999300001,
      "message": "Bad Gateway! - 1",
      "$$hashKey": "object:735"
    }
  ],
  "errorsNetwork": [
    {
      "errorTimestamp": 1392999300002,
      "errorCode": "500",
      "url": "amb.hpswdemoportal.com/Advantage/Customer/FraudPrevention",
      "diagKey": "V=1;ServerAddr=YujPZHb5PAJnvyxtL18RJw==;GUID=1|0wlS9Bo6wTbwh8yTzyHdFOBi5-xPTmrT8i1ZQSD67YI7FH7YuQDYqUHC6FZWPlYjslS4zcM9sIHmoCk5s1G5EddMz82QflZujvdbhSaZgkg.|L2FkdmFudGFnZV9kZXBsb3kvSW1hZ2VzL2NlcnRpZmljYXRlc19vZl9kZXBvc2l0LnBuZw..",
      "traceDrillUrl": "http://mydev.devdomain.com:8080/apmappsDiag/index.dev.html?TENANTID=123455#…w6wpgzUGAAAAAAAAAAoAAAAAAAAABQ%3D%3D&srId=-8962671141219961103&mobile=true",
      "$$hashKey": "object:742"
    }
  ],
  "errorsSdk": [
    {
      "errorTimestamp": 1392819400000,
      "exception": "VeryBadException",
      "exceptionMessage": "please Go home now!",
      "description": "this is obviously a very bad exception",
      "stackTrace": "at+com.hp.rom.mobile.useractions.testapp.CrashActivity.createArithmaticException(CrashActivity.java:99)\n\tat+com.hp.rom.mobile.useractions.testapp.CrashActivity.onDoCrash1(CrashActivity.java:78)\n\t...+14+more\njava.lang.ArithmeticException:+divide+by+zero\n\tat+com.hp.rom.mobile.useractions.testapp.CrashActivity.createArithmaticException(CrashActivity.java:99)\n\tat+com.hp.rom.mobile.useractions.testapp.CrashActivity.onDoCrash1(CrashActivity.java:78)\n\tat+java.lang.reflect.Method.invokeNative(Native+Method)\n\tat+java.lang.reflect.Method.invoke(Method.java:515)\n\tat+android.view.View$1.onClick(View.java:3809)\n\tat+android.view.View.performClick(View.java:4424)\n\tat+android.view.View$PerformClick.run(View.java:18383)\n\tat+android.os.Handler.handleCallback(Handler.java:733)\n\tat+android.os.Handler.dispatchMessage(Handler.java:95)\n\tat+android.os.Looper.loop(Looper.java:137)\n\tat+android.app.ActivityThread.main(ActivityThread.java:4998)\n\tat+java.lang.reflect.Method.invokeNative(Native+Method)\n\tat+java.lang.reflect.Method.invoke(Method.java:515)\n\tat+com.android.internal.os.ZygoteInit$MethodAndArgsCaller.run(ZygoteInit.java:777)\n\tat+com.android.internal.os.ZygoteInit.main(ZygoteInit.java:593)\n\tat+dalvik.system.NativeStart.main(Native+Method)\n",
      "$$hashKey": "object:777"
    },
    {
      "errorTimestamp": 1392819400001,
      "exception": "NumberFormatException",
      "description": null,
      "stackTrace": "Error: [ng:areq] Argument 'fn' is not a function, got string <http://errors.angularjs.org/1.2.7/ng/areq?p0=fn&p1=not> a function, got string\n   at <http://localhost:3000/lib/_ApmThirdParties-.js:18656:12\n>   at assertArg (<http://localhost:3000/lib/_ApmThirdParties-.js:19940:11)\n>   at assertArgFn (<http://localhost:3000/lib/_ApmThirdParties-.js:19950:3)\n>   at annotate (<http://localhost:3000/lib/_ApmThirdParties-.js:21596:5)\n>   at Object.invoke (<http://localhost:3000/lib/_ApmThirdParties-.js:22259:21)\n>   at <http://localhost:3000/lib/_ApmThirdParties-.js:23804:43\n>   at Array.forEach (native)\n   at forEach (<http://localhost:3000/lib/_ApmThirdParties-.js:18880:11)\n>   at Object.<anonymous> (<http://localhost:3000/lib/_ApmThirdParties-.js:23802:13)\n>   at Object.invoke (<http://localhost:3000/lib/_ApmThirdParties-.js:22282:17)\nError>: [ng:areq] Argument 'fn' is not a function, got string <http://errors.angularjs.org/1.2.7/ng/areq?p0=fn&p1=not> a function, got string\n   at <http://localhost:3000/lib/_ApmThirdParties-.js:18656:12\n>   at assertArg (<http://localhost:3000/lib/_ApmThirdParties-.js:19940:11)\n>   at assertArgFn (<http://localhost:3000/lib/_ApmThirdParties-.js:19950:3)\n>   at annotate (<http://localhost:3000/lib/_ApmThirdParties-.js:21596:5)\n>   at Object.invoke (<http://localhost:3000/lib/_ApmThirdParties-.js:22259:21)\n>   at <http://localhost:3000/lib/_ApmThirdParties-.js:23804:43\n>   at Array.forEach (native)\n   at forEach (<http://localhost:3000/lib/_ApmThirdParties-.js:18880:11)\n>   at Object.<anonymous> (<http://localhost:3000/lib/_ApmThirdParties-.js:23802:13)\n>   at Object.invoke (<http://localhost:3000/lib/_ApmThirdParties-.js:22282:17)\nError>: [ng:areq] Argument 'fn' is not a function, got string <http://errors.angularjs.org/1.2.7/ng/areq?p0=fn&p1=not> a function, got string\n   at <http://localhost:3000/lib/_ApmThirdParties-.js:18656:12\n>   at assertArg (<http://localhost:3000/lib/_ApmThirdParties-.js:19940:11)\n>   at assertArgFn (<http://localhost:3000/lib/_ApmThirdParties-.js:19950:3)\n>   at annotate (<http://localhost:3000/lib/_ApmThirdParties-.js:21596:5)\n>   at Object.invoke (<http://localhost:3000/lib/_ApmThirdParties-.js:22259:21)\n>   at <http://localhost:3000/lib/_ApmThirdParties-.js:23804:43\n>   at Array.forEach (native)\n   at forEach (<http://localhost:3000/lib/_ApmThirdParties-.js:18880:11)\n>   at Object.<anonymous> (<http://localhost:3000/lib/_ApmThirdParties-.js:23802:13)\n>   at Object.invoke (<http://localhost:3000/lib/_ApmThirdParties-.js:22282:17>)",
      "$$hashKey": "object:778"
    }
  ]
}
