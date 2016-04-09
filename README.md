# urlhda

Solution for URL shortening: nginx, postgres, json.  
Includes: website, android application, and simple bash script for url shortening.  
Live example: [hda.me](https://hda.me)
<p align="center">
 <img src="https://raw.githubusercontent.com/cryptofuture/urlhda/master/android_app/gradle/img/shot.png"/>
</p>
## Requirements

* [nginx](http://nginx.org) - nginx itself, better use source package from nginx.org repository for your favourite GNU/Linux distribution as base.  
* [postgres](http://www.postgresql.org/) - better use repository from postgresql.org.  
* [nginx devel kit](https://github.com/simpl/ngx_devel_kit) - lua-nginx-module dependency
* [nginx lua module](https://github.com/chaoslawful/lua-nginx-module)
* [nginx postgres module](https://github.com/FRiCKLE/ngx_postgres) 
* [nginx json module](https://github.com/openresty/rds-json-nginx-module)

## Configuration examples location and installation

* [conf folder](https://github.com/cryptofuture/urlhda/tree/master/conf) includes nginx.conf section example, site-enabled/sitename (vhost) example, sql file to import and debian rules file example useful for package rebuild.
* [script folder](https://github.com/cryptofuture/urlhda/tree/master/script) includes shortening bash script example.
* [website folder](https://github.com/cryptofuture/urlhda/tree/master/website) includes main url shortener website page example
* [android_app submodule](https://github.com/cryptofuture/urlhda-android) includes example android application, used for [hda.me](https://hda.me) url shortener website.  

Once you have nginx and the needed modules installed you can start nginx up with the the configuration in this found in /conf and /website folders.  

You also need to setup a database in your PostgreSQL-server and create separate table, don't forget set password. Use the /config/database.sql file to do it for you. After you are done adjust the settings to your environment in the nginx configuration.  
**Example:**  
Creating user and database: 
```
CREATE USER "user" WITH PASSWORD 'password';  
CREATE DATABASE databasename WITH OWNER "user";  
```
Importing:  
```
psql -h localhost -d databasename -U user -f database.sql
```

##Usage

1. [Script](https://raw.githubusercontent.com/cryptofuture/urlhda/master/script/urlhda)  
Edit host, chmod 755, and copy to /usr/local/bin/ 
Usage: urlhda http[s]://your_long_url_here  
2. [Website](https://raw.githubusercontent.com/cryptofuture/urlhda/master/website/index.html)   
Install, configure, edit [index.html](https://raw.githubusercontent.com/cryptofuture/urlhda/master/website/index.html) to change appearance for your needs and your done.  
3. [Android app](https://github.com/cryptofuture/urlhda-android)  
Change host in [index.html](https://raw.githubusercontent.com/cryptofuture/urlhda-android/master/app/src/main/assets/index.html), import to android studio, sign apk with your personal key and finally build apk.


## How it works
 <p align="center">
<img src="https://raw.githubusercontent.com/cryptofuture/urlhda/master/android_app/gradle/img/Diagram1.png"/>
</p>

You can shorten URLs with a POST-request:
```
  curl -X POST https://website.name/add?url=http://add.me
```

This will give you JSON-response back with the generated 5 character UID:
```
[{"uid":"abcd5"}]
```

With that you can go to for example to *https://website.name/abcd5* and you will be redirected to http://add.me

##Other
Original idea: Sebastian Gräßl, forked from https://github.com/bastilian/sebas  
Bitcoin donate: **1N5czHaoSLukFSTq2ZJujaWGjkmBxv2dT9**
