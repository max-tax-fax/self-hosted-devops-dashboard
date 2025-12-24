FROM nginx:alpine


COPY web/ /usr/share/nginx/html/


COPY dashboard.sh /usr/local/bin/dashboard.sh
RUN chmod +x /usr/local/bin/dashboard.sh


RUN apk add --no-cache bash


RUN echo "*/1 * * * * /usr/local/bin/dashboard.sh" > /etc/crontabs/root
RUN echo "*/30 * * * * /usr/local/bin/dashboard.sh" >> /etc/crontabs/root

CMD crond && nginx -g 'daemon off;'
