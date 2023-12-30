FROM node:16-alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#Second phase
FROM nginx
#Copy to where nginx says in dockerhub docs
COPY --from=builder /app/build /usr/share/nginx/html
#We do not need to start anything, nginx container will do it for us
