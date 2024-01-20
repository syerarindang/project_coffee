# Gunakan image node sebagai base image
FROM node:14 AS builder

# Set working directory
WORKDIR /app

# Salin file package.json dan package-lock.json ke dalam kontainer
COPY package*.json ./

# Install dependensi
RUN npm install

# Salin seluruh proyek
COPY . .

# Bangun proyek HTML
RUN npm run build

# Stage kedua menggunakan image ringan nginx untuk meng-host hasil build HTML
FROM nginx:alpine

# Salin hasil build dari stage pertama ke dalam nginx public directory
COPY --from=builder /app/dist /usr/share/nginx/html

# Ubah nama berkas utama menjadi index.html (sesuaikan dengan nama berkas utama Anda)
RUN mv /usr/share/nginx/html/coffeeweb.html /usr/share/nginx/html/coffeeweb.html

# Port yang akan di-EXPOSE
EXPOSE 80

# Perintah yang akan dijalankan saat container dijalankan
CMD ["nginx", "-g", "daemon off;"]
