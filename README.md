# urlhda

Solution for URL shortening: nginx, postgres, json.  
Includes: website, android app, and simple bash script for url shortening.  
Live example: [hda.me](https://hda.me)

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
* [android_app folder](https://github.com/cryptofuture/urlhda/tree/master/android_app) includes example android application, where apk file is actual aplication used for [hda.me](https://hda.me) url shortener website.  

Once you have nginx and the needed modules installed you can start nginx up with the the configuration in this found in /conf and /website folders.  

You also need to setup a database in your PostgreSQL-server and create separate table, don't forget set password. Use the /config/database.sql file to do it for you. After you are done adjust the settings to your environment in the nginx configuration.  
**Example:**
Creating user and database:  
CREATE USER "user" WITH PASSWORD 'password';  
CREATE DATABASE databasename WITH OWNER "user";  
Importing:  
psql -h localhost -d databasename -U user -f database.sql  

## Usage

You can shorten URLs with a POST-request:
```
  curl -X POST http://sebas.dev/add?url=http://bastilian.me
```

This will give you JSON-response back with the generated 5 character UID:
```
[{"uid":"abcd5"}]
```

With that you can go to for example to *http://sebas.dev/abcd5* and you will be redirected to http://bastilian.me
