# Stage pertama: Gunakan image nginx sebagai base image
FROM nginx:alpine AS builder

# Set working directory di dalam image nginx
WORKDIR /usr/share/nginx/html

# Salin file HTML dan asset lainnya ke dalam image
COPY . .

# Port yang akan di-EXPOSE
EXPOSE 80

# Perintah yang akan dijalankan saat container dijalankan
CMD ["nginx", "-g", "daemon off;"]
