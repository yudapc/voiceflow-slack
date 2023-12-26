# Use an official Node.js runtime as the base image
FROM node:18.18.2-alpine3.18

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the project files to the container
COPY . .

# apply ENV
ENV SLACK_SIGNING_SECRET=""
ENV SLACK_APP_TOKEN=""
ENV SLACK_BOT_TOKEN=""
ENV VOICEFLOW_VERSION_ID=""
ENV VOICEFLOW_PROJECT_ID=""
ENV VOICEFLOW_API_KEY=""

# Expose the port your application listens on
EXPOSE 8080

# Start the application
CMD [ "npm", "start" ]