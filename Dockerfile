FROM nginx:alpine

# Копируем наши веб-файлы в контейнер
COPY web/ /usr/share/nginx/html/

# Копируем скрипт
COPY dashboard.sh /usr/local/bin/dashboard.sh
RUN chmod +x /usr/local/bin/dashboard.sh

# Устанавливаем bash (нужен для скрипта)
RUN apk add --no-cache bash

# Создаём задачу cron: запуск скрипта каждые 30 секунд
RUN echo "*/1 * * * * /usr/local/bin/dashboard.sh" > /etc/crontabs/root
RUN echo "*/30 * * * * /usr/local/bin/dashboard.sh" >> /etc/crontabs/root

# Запускаем cron и nginx одновременно
CMD crond && nginx -g 'daemon off;'
