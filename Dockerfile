FROM node:18

# Install nginx
RUN apt update && apt install -y nginx

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Copy nginx config
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
EXPOSE 3000

CMD ["sh", "-c", "service nginx start && node app.js"]
