# build phase
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build


# run phase
FROM nginx
COPY --from=builder --chown=node:node /app/build/ /usr/share/nginx/html




# BELOW IS USING EXTRA LINES THAT WAS USED TO FIX FRONTEND - MAY NEED TO TRY USE THIS

# # build phase
# FROM node:16-alpine as builder
 
# USER node
 
# RUN mkdir -p /home/node/app
# WORKDIR /home/node/app
 
# COPY --chown=node:node ./package.json ./
# RUN npm install
# COPY --chown=node:node ./ ./
 
# RUN npm run build


# # run phase
# FROM nginx

# COPY --from=builder --chown=node:node /app/build/ /usr/share/nginx/html
 