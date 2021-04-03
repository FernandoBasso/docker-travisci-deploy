#
# This Dockerfile.dev file is used for development. Run it with:
#
# We use a two phase/step build. Step 1 install node and npm dependencies so
# we can run the command that builds the production-ready static files. The
# second step copies the production files to an nginx image so we have a final
# image with the production static files ready to be served from an nginx
# container.
#

##
# PHASE #1
#
# Tag this build phase as ‘builder’. This phase does not end up in the final
# nginx image. It is “just” an intermediate step to reach our final goal.
#
FROM node:alpine as builder
USER node
RUN mkdir -pv /home/node/app
WORKDIR /home/node/app
COPY --chown=node:node package.json .
RUN npm install
COPY --chown=node:node . .

##
# Builds the production bundle in /home/node/app/build in the container.
#
RUN npm run build

##
# PHASE #2
#
FROM nginx
COPY --from=builder /home/node/app/build /usr/share/nginx/html
#
# nginx container has a default command to start the server. We don't need to
# do anything else to start the nginx server. 😄
#
