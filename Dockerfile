# build phase
FROM node:alpine as build-phase

WORKDIR '/app/react-docker'

COPY ./package*.json ./

RUN npm install --silent

COPY ./ ./

RUN npm run build

# running phase

FROM nginx

EXPOSE 80

COPY --from=build-phase /app/react-docker/build /usr/share/nginx/html

