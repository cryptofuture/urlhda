# urlhda

Solution for URL shortening: nginx, postgres, json.  
Includes: website, android app, and simple bash script for url shortening.  
Live example: [hda.me](https://hda.me)

## Requirements

* [nginx](http://nginx.org) - Nginx itself, better use source package from nginx.org repository for your favourite GNU/Linux distribution as base.  
* [postgres](http://www.postgresql.org/) - Better use repository from postgresql.org.  
* [nginx devel kit](https://github.com/simpl/ngx_devel_kit) - lua-nginx-module dependency
* [nginx lua module](https://github.com/chaoslawful/lua-nginx-module)
* [nginx postgres module](https://github.com/FRiCKLE/ngx_postgres) 
* [nginx json module](https://github.com/openresty/rds-json-nginx-module)

## Installation

Once you have nginx and the needed modules installed you can either start nginx up with the the configuration in this repository or you can copy the 'server'-section into your own nginx.conf.

You also need to setup a database in your PostgreSQL-server and create a table called "links". Use the config/db.sql file to do it for you. After you are done adjust the settings to your environment in the nginx configuration.

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
