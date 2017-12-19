# Simple React Webpack Babel Starter Kit

## Dependencies

* React 16
* Webpack 3
* React Router 4
* SASS
* Babel Cli
* Hot Module Reloading
* Jest 21 
* Enzyme 3 for testing

## Features

* Simple src/index.jsx and src/index.css (local module css).
* Webpack configuration for development (with hot reloading) and production (with minification).
* CSS module loading, so you can include your css by ```import styles from './path/to.css';```.
* Both js(x) and css hot loaded during development.
* [Webpack Dashboard Plugin][3] on dev server.

## Run

* You'll need to have [git][4] and [node][5] installed in your system.
* Fork and clone the project:

```
git clone https://github.com/alicoding/react-webpack-babel.git
```

* Then install the dependencies:

```
npm install
```

* Run development server:

```
npm start
```

* Or you can run development server with [webpack-dashboard][3]:

```
npm run dev
```

Open the web browser to `http://localhost:8888/`

## Test
To run unit tests:

```
npm test
```

Tests come bundled with:

* Jest
* Enzyme
* React Test Utils
* React Test Renderer

### To build the production package

```
npm run build
```

## Nginx Config
This is the configuration for a MacBook. While not strictly necessary for development, this can sever as a guide for containerization. On a Mac, you should use brew to install the server: `brew install nginx`. Preferably don't run it as a service because it is more convinent to reload the ngnix configuration via direct signals.

- The default location for `docroot` on the Mac is:

```
/usr/local/var/www
```

- The default nginx configuration will start a server on `8080` and load all other server definitions in:

```
/usr/local/etc/nginx/servers
```

- As a sidenote, the default server `root` is `html` and linked thusly.

```
/usr/local/Cellar/nginx/[version]/html -> /usr/local/var/www
```

- Reload Configuration / Start / Stop:

```
nginx -s [reload|start|stop]
```

- I've linked the configuration found in this repo to this location:

```
/usr/local/etc/nginx/servers/webpack-demo.conf -> ./webpack-demo.conf
```

[Some tips][6] on brew nginx.

## Eslint
There is a `.eslint.yaml` config for eslint ready with React plugin.

To run linting, run:

```
npm run lint
```

## Docker Contatiner
### Local
For local development, it is helpful to uncomment the development dependencies in the `Dockerfile`:
```
# Dev Deps
RUN apk add bash bash-doc bash-completion
RUN apk add curl
```

Then run:
```
docker build .
docker run -d -p 8080:80 [image] nginx -g 'daemon off;'
curl localhost:8080
docker exec -i -t [container] /bin/bash
```

### Cloud
For pushing the container to the cloud:
Comment out the development dependencies (if you followed the steps above), then run:
```
docker build .
docker tag [image] splicemachine/node-splice
docker push splicemachine/node-splice
```

## Notes on importing css styles
* styles having /src/ in their absolute path considered part of the application and exported as local css modules.
* other styles considered global styles used by components and included in the css bundle directly.

## Development Notes
[Notes][7] that don't belong in the readme.md

[1]: https://github.com/alicoding/react-webpack-babel
[2]: https://github.com/splicemachine
[3]: https://github.com/FormidableLabs/webpack-dashboard
[4]: https://git-scm.com/
[5]: https://nodejs.org/en/
[6]: http://learnaholic.me/2012/10/10/installing-nginx-in-mac-os-x-mountain-lion/
[7]: ./docs/dev-notes.md
