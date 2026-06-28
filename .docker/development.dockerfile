FROM node:18

RUN useradd --user-group --create-home --shell /bin/false app

ENV HOME=/home/app
ENV APP_NAME=angularspree-client

WORKDIR $HOME

COPY . $HOME/$APP_NAME/
RUN chown -R app:app $HOME/*

USER app
WORKDIR $HOME/$APP_NAME

RUN npm install --legacy-peer-deps

CMD ["npm","run","start:mock-ng-spree"]
