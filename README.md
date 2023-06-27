# Docker Symfony

Image to run Symfony apps in docker

## Quick reference

### Build the image

```
docker build -t davidetriso/symfony:[tagname-dir_name] ./[tagname-dir_name]
```

E.g.:

```
docker build -t davidetriso/symfony:php-8.1-fpm ./php-8.1-fpm
```

### Push image to Docker Hub

```
docker push davidetriso/symfony:tagname
```

E.g.:

```
docker push davidetriso/symfony:php-8.1-fpm
```

###  Build and push everything

Execute the `./build-and-push.sh` script to build and push all images to Docker Hub at once.


## How to use

This image is created starting from the official PHP Docker image. Look at the "How to use this image" section of the [official image readme](https://hub.docker.com/_/php) to learn how to configure and use this image.

The image uses a production-optimized php.ini file. To customize the PHP settings to your needs it is sufficient to bind-mount a custom ini file in the container's `/usr/local/etc/php/conf.d/` directory.

E.g.:

```yaml
symfony:
    # ... other settings here ...
    volumes:
        # ... other volumes and mounts here ...
        - ./my/custom/999-php.ini:/usr/local/etc/php/conf.d/999-php.ini:ro
```

### Cron Images

The chron images facilitate the execution of tasks at regular intervals. They provide a convenient folder structure in the `/etc/periodic` path, which includes the following subfolders:

* 1min
* 5min
* 10min
* 15min
* 20min
* 30min
* hourly
* daily
* weekly
* monthly

To schedule a task, simply place the script in one of the folders corresponding to the desired execution interval.
For instance, to run the `php bin/console schedule:run` command every 5 minutes, create a script that invokes the command and copy the file to the `/etc/periodic/5min` folder. 

> NOTE: Please ensure that the script has no file extension.


Here's an example of the `run-schedule` script:

```ash
#!/bin/ash

php /var/www/html/bin/console schedule:run
```

In your configuration file, include the following volume mapping to make the script available in the container:

```yaml
schedule_runner:
    image: davidetriso/symfony:php-8.1-cron
    # ... other settings here ...
    volumes:
        # ... other volumes and mounts here ...
        - ./run-schedule:/etc/periodic/5min/run-schedule:rw
```

> NOTE: When the container starts up, all scripts located in the subfolders of `/etc/periodic/5min` are made executable using the `chmod` command. Hence, it is important to ensure that these files are writable by the container.

### Debugging

The `XDebug` extension is available in the image, but is disabled by default. To enable it, use a custom `ini` file, like explained above.


## License

Licensed under the terms of the [MIT](LICENSE) license.