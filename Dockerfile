# Use official Node.js LTS image
FROM node:18

# Set working directory inside container
WORKDIR /app

# Copy package files and install deps (optional if using npm modules)
COPY package*.json ./
RUN npm install

# Copy your app code
COPY . .

# Command to run your app
CMD [ "node", "index.js" ]

