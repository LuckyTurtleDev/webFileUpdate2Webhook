# webFileUpdate2Webhook
webFileUpdate2Webhook will send a webhook if a web file is updated. 

usage:
```
./webFileUpdate2Webhook.sh [web file] [webhook]
```

A third optional parameter is a grep instruction, which is used during the comparison.  
example:
```
./webFileUpdate2Webhook.sh https://example.com/rss https://example2.com/webhook '/^<!/d'

```

[Docker Image](https://cloud.docker.com/repository/docker/lukas1818/webfileupdate2webhook)
