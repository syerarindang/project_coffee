# Stage pertama: Gunakan image nginx sebagai base image
FROM nginx:alpine AS builder

#Remove the default Nginx welcome page
RUN rm -rf /usr/share/nginx/html/*

WORKDIR /usr/share/nginx/html
#Copy the HTML file to the Nginx web server root
COPY . /usr/share/nginx/html

#Expose the default Nginx port (80)
EXPOSE 80

# Perintah yang akan dijalankan saat container dijalankan
CMD ["nginx", "-g", "daemon off;"]
WORKDIR /usr/share/nginx/html