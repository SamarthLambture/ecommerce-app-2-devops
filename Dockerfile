# FROM node:18

# RUN useradd --user-group --create-home --shell /bin/false app

# ENV HOME=/home/app
# ENV APP_NAME=angularspree-client

# WORKDIR $HOME

# COPY . $HOME/$APP_NAME/
# RUN chown -R app:app $HOME/*

# USER app
# WORKDIR $HOME/$APP_NAME

# RUN npm install --legacy-peer-deps

# CMD ["npm","run","start:mock-ng-spree"]


# --- Stage 1: Build ---
FROM node:18 AS builder
WORKDIR /app
COPY . .
RUN npm install --legacy-peer-deps && npm run build

# --- Stage 2: Production ---
FROM nginx:alpine
# Copy only the compiled artifacts from the builder stage
COPY --from=builder /app/dist/angularspree-client /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]