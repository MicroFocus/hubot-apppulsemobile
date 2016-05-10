/**
 * Created by seldin on 2/28/2016.
 */
var request = require('sync-request');
var util = require('util');
var daysToSubtract = 2;
var tenantId=process.env.TENANT_ID;
var authDetails=undefined;
var saasPrefix = process.env.SAAS_PREFIX;
var saasUrl = process.env.SAAS_URL;

function makeAuth() {
  var currTime = new Date().getTime();
  if(authDetails!=undefined){
    var delta = authDetails.expirationTime - currTime;

    console.log(util.format("Auth details : Current time: %s , expiration time: %s delta : %s",
      currTime,authDetails.expirationTime,delta));

    if(delta> 0){
      console.log("Current time is less than expiration time - no auth required");
      return;
    }

    console.log("Current time is larger than expiration time - auth required!");
  }

  console.log("Making authentication!");
  var req = request('POST', util.format('%s/v1/%s/oauth/token',saasPrefix,tenantId), {
    json:{
      clientSecret: process.env.CLIENT_SECRET,
      clientId: process.env.CLIENT_ID
    }
  });

  authDetails = JSON.parse(req.getBody('utf8'));
  console.log("Authentication passed!");
}

function executeOpenApi(url){
  url = saasPrefix + url;
  var res = request('GET', url, {
    'headers': {
      'Authorization':'Bearer ' + authDetails.token
    }
  });

  //console.log("Result : " + JSON.stringify(res));
  //console.log("Result Body: " + res.getBody());

  return res.getBody();

}

String.prototype.lpad = function(padString, length) {
  var str = this;
  while (str.length < length)
    str = padString + str;
  return str;
}

function formatDate(date){
  console.log("formatDate : " + date);

  var month = (date.getMonth() +1).toString();
  var day = date.getDate().toString();
  var year = date.getFullYear().toString();

  console.log("day: " + day + " month: " + month + " year: " + year);

  return date.getFullYear() + "-" + month.lpad("0",2) + "-" + day.lpad("0",2);

}

module.exports = {
  setDaysToSubstract:function(days){
    daysToSubtract = days;
  },
  getDaysToSubstract:function(){
    return daysToSubtract
  },


  getSaaSUrl:function () {
    return saasUrl;
  },

  getTenantId : function(){
    return tenantId;
  },
  getApps: function() {
    makeAuth();

    var resJson= executeOpenApi(util.format('/v1/%s/applications',tenantId));

    console.log("Result from applications query to server is : \n" + JSON.stringify(JSON.parse(resJson)));

    return JSON.parse(resJson).data.applications;
  },

  getFundex: function(appId) {
    makeAuth();


    var to_day = new Date();
    var from_day = new Date();
    from_day.setDate(from_day.getDate() - daysToSubtract);

    console.log("From day: " + from_day);
    console.log("To day: " + to_day);

    var to_day_formatted = formatDate(to_day);
    var from_day_formatted = formatDate(from_day);

    console.log("From day formatted: " + from_day_formatted);
    console.log("To day formatted: " + to_day_formatted);

    var resJson= executeOpenApi(
      util.format('/v1/%s/applications/%s/metrics/fundex/overview?from_day=%s&to_day=%s',
        tenantId,appId,from_day_formatted,to_day_formatted));

    return JSON.parse(resJson);
  },

  getTopUAWithErrors:function(appId){
    var from_day = new Date();
    from_day.setDate(new Date().getDate() - daysToSubtract);

    console.log("From day: " + from_day);

    var from_day_formatted = formatDate(from_day);

    var query = util.format('/v1/%s/applications/%s/metrics/useractions/errors?from_day=%s',
      tenantId,appId,from_day_formatted);
    console.log("Errors api query : " + query);

    var resJson= executeOpenApi(query);

    console.log("Result json : \n" + resJson);

    return JSON.parse(resJson);
  },

 getTopUAWithCrashes:function(appId){
    var from_day = new Date();
    from_day.setDate(new Date().getDate() - daysToSubtract);

    console.log("From day: " + from_day);

    var from_day_formatted = formatDate(from_day);
    var resJson= executeOpenApi(
      util.format('/v1/%s/applications/%s/metrics/useractions/crashes?from_day=%s',
        tenantId,appId,from_day_formatted));

    return JSON.parse(resJson);
  },
  getTopUAWithPerformance:function(appId){
    var from_day = new Date();
    from_day.setDate(new Date().getDate() - daysToSubtract);

    console.log("From day: " + from_day);

    var from_day_formatted = formatDate(from_day);
    var resJson= executeOpenApi(
      util.format('/v1/%s/applications/%s/metrics/useractions/performance?from_day=%s',
        tenantId,appId,from_day_formatted));

    return JSON.parse(resJson);
  }
};
