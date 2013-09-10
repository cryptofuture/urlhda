# sebas

This is an (example) configuration for a nginx url-shortener.
It is very small, simple and probably fast.

## Requirements

* [nginx](http://nginx.org)
* [nginx posgres module](https://github.com/FRiCKLE/ngx_postgres/)
* [nginx lua module](https://github.com/chaoslawful/lua-nginx-module)

_Note:_ If you just wanna play around with it, take a look at [OpenResty](http://openresty.org) which includes all needed modules out of the box.

## Installation

Once you have nginx and the needed plugins installed you can either start nginx up with the the configuration in this repository or you can copy the 'server'-section into your own nginx.conf.

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


## License 

Copyright (c) 2013 Sebastian Gräßl

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.