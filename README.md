Webpage for [urlhda.hda.me](https://urlhda.hda.me)
### How it works
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
