FROM node:lts

WORKDIR /app

COPY ./package.json ./package.json

RUN npm i

COPY . .

RUN npm run build

CMD ["npm", "start"]