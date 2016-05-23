# NASEBANAL Platform for Iot

This is an open source project for the IoT platform.
You can see the demo from https://www.youtube.com/watch?v=p_HXt_Oj4GI


[Prerequisite]

* Install Ruby On Rails
* Install PostgreSQL Server


[How To Use]

Step.1) Get source code.

 $ git clone https://github.com/nasebanal/nb-platform4iot.git

Step.2) Setup environment variable

PARAMETER|DESCRIPTION|EXAMPLE
---------|-----------|-------
NB_GITHUB_KEY|Public key for GitHub User Auth|xxxx
NB_GITHUB_SECRET|Secret key for GitHub User Auth|xxxx

Step.3) Create Database.

 $ rake db:migrate

Step.4) Run the service.

 $ rails s -b 0.0.0.0

Then you can access the front page from http://[host IP address]:3000/
