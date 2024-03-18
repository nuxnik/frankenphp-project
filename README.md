### NOTE: WIP

# Frankenphp Project Docker

Runs a frankenphp docker container to run your amazing work. Just to get started instead of configuring all by yourself.

## QuickStart
this is ment to be used inside your project as git submodule, this quickstart should get you stared


**Download and Install**
first create your php project directory, then pull clone this repo in

```bash
mkdir my-amazing-project
cd my-amazing-project
git clone <repo> docker
cp docker/example.env .env
```

ok, you are ready to go, now start the contaner

```bash
docker compose -f docker/docker-compose.dev.yml up -d
```

This brings up the container at port 8080 and 4443.
Take a look at `docker/.env` to configure everything correctly. In this very small example, 
mercure.hub won`t start because there are no secrets filled. 

```bash
DC_MERCURE_PUBLISHER_JWT_KEY=
DC_MERCURE_SUBSCRIBER_JWT_KEY=
```

Ok, the server runs, but, what should I do now?

```bash
mkdir public
touch "<?php phpinfo()" > public/index.php
```

reload your Browser, now you get a simple `phpinfo()`.

Ok, what about Laravel 

There are some Helpers in `bin` directory, use `login.sh` to open bash in the container.
Or use `exec.sh` to execute commands on the container, for example running a script.

Files located `/bin/d/` are ment to get executed inside the container, not on the host.
To do so, run 
```bash
./docker/bin/exec.sh ./docker/bin/install-laravel.sh
```
and the latest laravel will be installed. 
NOTE: laravel, since version 10 (i think), serves a `.env` file for better experience, to avoid overriding some file, 
the file gets renamed to `.env-laravel`. You can rename it back, when the installer is done.

NOTE2: make sure your directory is empty, only `.env` and `/docker` should be there, this will override everything.

### usage as submodule
instead of running a git clone, you can run
```bash
git submodule add https://github.com/pictus/frankenphp-project.git docker
```