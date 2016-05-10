# hubot-apppulsemobile


## Installation

In hubot project repo, run:

`npm install hubot-apppulsemobile --save`

Then add **hubot-apppulsemobile** to your `external-scripts.json`:

```json
[
  "hubot-apppulsemobile"
]
```

## Sample Interaction

```
user1>> apppulse get apps
hubot>> list of apps
```

## Before running with hubot
Hubot should be run with the following env variables to support this script:

	SAAS_PREFIX=[prefix to saas open api e.g: http://myd-vm21820.hpswlabs.adapps.hp.com/mobile/openapi/rest]
	SAAS_URL=[saas base url : e.g : http://myd-vm21820.hpswlabs.adapps.hp.com/]
	TENANT_ID=[apppulse mobile tenant id]
	CLIENT_SECRET=[apppulse mobile client openapi secret]
	CLIENT_ID=[apppulse mobile client openapi id]

## Availble commands:

##### Get list of availble apps for tenant:

	apppulse get apps

##### Get fundex for specified application (will bring both data for iOS and Android):

	apppulse get fundex for [app name]

##### Get list of top errors for specified application (will bring both data for iOS and Android):

	apppulse get errors for [app name]

##### Dislpay apppulse help:

	apppulse help

##### Enable/Disable mock data for the following commands:

* get fundex

* get errors


	apppulse set mock data [enabled\disabled]
    
##### Get mock data status:
    apppulse mock data status
##### Set number of days to substrcut from current days for getting the data from open api:

	apppulse set days to substruct [num of days]
    
##### Get number of days to substrcut from current days for getting the data from open api:

	apppulse get days to substruct [num of days]




