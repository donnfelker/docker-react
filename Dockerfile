FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . . 
RUN npm run build

# copy over the built app
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
# Default command of the nginx container is to start nginx, no need to provide run command
