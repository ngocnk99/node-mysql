FROM node:15.10.0

ENV NODE_OPTIONS="--max-old-space-size=4096"

ARG node_env=development

WORKDIR /usr/src/app

# you'll likely want the latest npm, regardless of node version, for speed and fixes
# but pin this version for the best stability
RUN npm i npm@6.14.11 -g
RUN npm install @mysql/xdevapi --save --save-exact
COPY package*.json ./

RUN npm install && npm cache clean --force

COPY . .

RUN if [ "${node_env}" = "production" ]; then npm run build; fi

CMD ["npm", "run", "dev"]
