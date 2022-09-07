FROM node:10

LABEL "repository"="https://github.com/DispatchHealth/auto-assign"
LABEL "maintainer"="Eugenio Garcia"

ENV PATH=$PATH:/app/node_modules/.bin
WORKDIR /app
COPY . .
RUN npm install --production && npm run build

ENTRYPOINT ["probot", "receive"]
CMD ["/app/lib/index.js"]
