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

//TODO

The image uses a production-optimized php.ini file. To customize the PHP settings to your needs it is sufficient to bind-mount a custom ini file in the container's `/usr/local/etc/php/conf.d/` directory.

E.g.:

```yaml
symfony:
    # ... other settings here ...
    volumes:
        # ... other volumes and mounts here ...
        - ./my/custom/999-php.ini:/usr/local/etc/php/conf.d/999-php.ini:ro
```

### Debugging

The `XDebug` extension is available in the image, but is disabled by default. To enable it, use a custom `ini` file, like explained above.


## License

Licensed under the terms of the [MIT](LICENSE) license.