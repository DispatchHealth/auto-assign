FROM node:alpine as builder

WORKDIR /app
COPY ./package*.json ./
RUN npm install --production

FROM node:alpine

LABEL "com.github.actions.name"="Auto Assign"
LABEL "com.github.actions.description"="Add reviewers/assignees to pull requests when pull requests are opened."
LABEL "com.github.actions.icon"="user-plus"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/DispatchHealth/auto-assign"
LABEL "maintainer"="Eugenio Garcia"

ENV PATH=$PATH:/app/node_modules/.bin
WORKDIR /app
COPY --from=builder /app/node_modules/ ./node_modules/
COPY . .
RUN npm run build
EXPOSE 3000
ENTRYPOINT ["probot", "run"]
CMD ["/app/lib/index.js"]
