FROM alpine
RUN apk update && apk upgrade

# Prod Deps
RUN apk add nodejs
RUN apk add nginx

# Dev Deps
# RUN apk add bash bash-doc bash-completion
# RUN apk add curl

RUN mkdir -p /run/nginx/
RUN touch /run/nginx/nginx.pid
RUN rm /etc/nginx/conf.d/default.conf

WORKDIR /app
ADD ./public /app
ADD ./config/alpine.nginx.conf /etc/nginx/conf.d/
#ENTRYPOINT [ "node", "server.js" ]
#ENTRYPOINT [ "nginx" ]
CMD ["nginx", "-g", "daemon off;"]
# With all this disabled, we can use this to run nginx as a background container:
# docker run -d -p 80:80 [image] nginx -g 'daemon off;'

# Attach terminal to this running container
# docker exec -i -t [container] /bin/bash
