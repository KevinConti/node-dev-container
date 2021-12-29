FROM node:12-stretch

USER node

# Make the directory as the node user so we have permissions
RUN mkdir /home/node/code

WORKDIR /home/node/code

# Copy npm stuff
COPY --chown=node:node package-lock.json package.json ./

# The equivalent of npm i, but uses package lock instead of regular package
RUN npm ci

# Copy source code. Use .dockerignore to ignore particular files
COPY --chown=node:node . .

EXPOSE 3000

CMD ["node", "index.js"]