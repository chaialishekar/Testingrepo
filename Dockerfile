# Use the official Node.js 14.20.0 image as the base image
FROM node:14.20.0-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

COPY .env.example ./.env

# Use npm to install Yarn
# RUN npm install -g yarn

# Install python
RUN apk add --no-cache python3

# Install make
RUN apk add --no-cache make

# Install g++
RUN apk add --no-cache g++


# Use Yarn to install the project dependencies
RUN yarn install

# Copy the rest of the application files to the working directory
COPY . .

# Build the application
RUN yarn build

# Expose the port that the application will run on
EXPOSE 3000

# Start the application
CMD ["yarn", "start"]
