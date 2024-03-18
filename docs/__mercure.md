## mercure.hub is configured for this project
- listening/pushing to public channels is working
- next step: private channels

## files and resources
`docker/Dockerfile.web` see `ENV` entries for keys
-> will be made configurable later

`resources/js/app.js` for Client Side implementation
`routes/web.php` here the event is triggered
`app/Events/SendNotification.php` is the Event that is broadcasting
`config/broadcast.php` for configuration
`.env` for per-project configuration

## required params in .env

```ini
# set the driver
BROADCAST_DRIVER=mercure

# set the secret, thats the secret from Dockerfile
MERCURE_SECRET=4siLaHyg+YrO8ap1bu5IaTkgdEwsLECZ7sXQVHICaCc=

# set the url, note the URL is in the container
# so you need to use :443 instead of your port config from Docker
MERCURE_URL=https://localhost:443/.well-known/mercure
```