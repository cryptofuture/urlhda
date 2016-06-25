# urlhda

######Open-source URL shortener. Solution for URL shortening: nginx, postgres, json
Includes: website, android application, and simple bash script for url shortening.  
#####Features:  
* [Strong URL](https://github.com/cryptofuture/urlhda/issues/3) (15 symbols long uid for shorted URLs, 5 symbols by default).
* Fast copy-paste. Auto selection in browser, and copy button in android app.
* Ability to share URLs (Android App only).
Live example: [hda.me](https://hda.me)


## To use it as service
* You can use [hda.me](https://hda.me) website.
* You can use HDA URL (Urlhda) android application  
[<img src="https://f-droid.org/badge/get-it-on.png"
      alt="Get it on F-Droid"
      height="80">](https://f-droid.org/app/me.hda.urlhda)
* Or you can use Urlhda from CLI.  
Install it via PPA.
```bash
sudo apt-add-repository ppa:hda-me/urlhda
sudo apt-get update
sudo apt-get install urlhda
```
Or copy [this script](https://raw.githubusercontent.com/cryptofuture/urlhda/master/script/urlhda) to `/usr/local/bin`

## To setup it yourself

### Requirements
* [nginx](http://nginx.org) - nginx itself, better use source package from nginx.org repository for your favourite GNU/Linux distribution as base.  
* [postgres](http://www.postgresql.org/) - better use repository from postgresql.org.  
* [nginx devel kit](https://github.com/simpl/ngx_devel_kit) - lua-nginx-module dependency
* [nginx lua module](https://github.com/chaoslawful/lua-nginx-module)
* [nginx postgres module](https://github.com/FRiCKLE/ngx_postgres) 
* [nginx json module](https://github.com/openresty/rds-json-nginx-module)  
Note: As alternative you can setup nginx from [ppa:hda-me/nginx-stable](https://gist.github.com/cryptofuture/53efe118c598dcc8eaf402c8544182af) or try run setup on [openresty](https://openresty.org/) project.

### Configuration examples location and installation

* [conf folder](https://github.com/cryptofuture/urlhda/tree/master/conf) includes nginx.conf section example, site-enabled/sitename (vhost) example, sql file to import and debian rules file example, useful for package rebuild.
* [script folder](https://github.com/cryptofuture/urlhda/tree/master/script) includes shortening bash script example.
* [website folder](https://github.com/cryptofuture/urlhda/tree/master/website) includes url shortener website page example
* [android_app](https://github.com/cryptofuture/urlhda-android) android application, used for [hda.me](https://hda.me) url shortener website.

Once you have nginx and the needed modules installed you can start nginx with the the configuration from /conf and /website folders.  

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
Upgrading old installation (database) for [Strong URLs](https://github.com/cryptofuture/urlhda/issues/3) support:
```
\c databasename
ALTER TABLE links ALTER COLUMN uid TYPE character varying(30);
```

### Usage

1. [Script](https://raw.githubusercontent.com/cryptofuture/urlhda/master/script/urlhda)  
Edit host, chmod 755, and copy to /usr/local/bin/ 
Or you can install it via PPA: 
```bash
sudo apt-add-repository ppa:hda-me/urlhda
sudo apt-get update
sudo apt-get install urlhda
```
Usage:
# 5 symbols uid (default)  
urlhda http[s]://your_long_url_here  
# To generate Strong URL (15 symbols uid)  
urlhda -s http[s]://your_long_url_here 

2. [Website](https://raw.githubusercontent.com/cryptofuture/urlhda/master/website/index.html)   
Edit [index.html](https://raw.githubusercontent.com/cryptofuture/urlhda/master/website/index.html) to change appearance for your needs and your done.  
3. [Android app](https://github.com/cryptofuture/urlhda-android)  
[Install app](https://f-droid.org/repository/browse/?fdid=me.hda.urlhda) and change hostname URL in application Settings (gear icon).

## How it works
 <p align="center">
<img src="https://raw.githubusercontent.com/cryptofuture/urlhda-android/master/gradle/img/Diagram1.png"/>
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

## Other
Original idea: Sebastian Gräßl, forked from https://github.com/bastilian/sebas  
Bitcoin donate: 1N5czHaoSLukFSTq2ZJujaWGjkmBxv2dT9
