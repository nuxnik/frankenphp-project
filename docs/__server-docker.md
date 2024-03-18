## server & docker setup

`docker compose up -d` to start container.
Use port `localhost:4443` to access site.


### configuration

edit `./docker/data/php.ini` for your needs. 

### ssl on local enviroment

caddy creates a self_signed certificate on `localhost`.
You can accept this `cert` on your OS, congrats you have SSL and HTTP2 enabled


### accept self-signed on mac
The Caddy config directory is mounted in dev-enviroment. In production, the files are copied in.
`docker/data/caddy/caddy/certificates` contains a signed certificate. It may not work on your machine, then delete everything under `docker/data/caddy` and reboot your machine (maybe multiple times).
-> in next releases the will be a better solution for this.

Back to `./docker/data/caddy/caddy/certificates`... 

Open the Terminal.
Navigate to the directory where your self-signed certificate is located.
Run the following command to import the certificate into the keychain:

```bash
sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain localhost.crt
```
Open the Keychain on your Mac. 
In the left sidebar of the Keychain, you should see "System." Click on it to open the system keychains.
Look for your self-signed certificate under "Certificates."

Double-click on the self-signed certificate to open it.
Expand the dropdown menu next to "Trust."
Select "Always Trust" for SSL.
Close the window.

Alternative, you can trust the `Caddy Local Authority - ECC Intermediate` but its not "that" recommended - you may trust to much ;).