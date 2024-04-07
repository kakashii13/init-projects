#!/bin/bash

# Directories
source config.sh

# Check if are a name to create a new project
if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory-keyword> <project-name>"
    exit 1
fi

# Check if the directory is valid
if [ ! -d ${directories[$1]} ]; then
    echo "Invalid directory"
    exit 1
fi

# Directory to create a new project
directory=$1

# Name of project 
project_name=$2

# Navigate to the directory

cd ${directories[$directory]}

# Create a new project
mkdir $project_name
cd $project_name

# Install dependencies
npm init -y
npm install express 
npm install -D @types/express typescript ts-node-dev dotenv  

# Edit the package.json file
echo '{
    "name": "'$project_name'",
    "version": "1.0.0",
    "description": "",
    "main": "index.js",
    "scripts": {
        "start:dev": "ts-node-dev src/index.ts",
        "test": "echo \"Error: no test specified\" && exit 1"
    },
    "author": "'$author'",
    "license": "ISC"
}' > package.json


# Create a new tsconfig.json file
echo '{
    "compilerOptions": {
        "target": "es6",
        "module": "commonjs",
        "outDir": "./dist",
        "rootDir": "./src",
        "strict": true,
        "esModuleInterop": true,
        "skipLibCheck": true,
        "forceConsistentCasingInFileNames": true
    }
}' > tsconfig.json

# Create a new src folder
mkdir src
cd src

# Create a new index.ts file and app.ts file
echo 'import express from "express";
    const app = express();

    app.get("/", (req, res) => {
        res.send("Hello World");
    });

    export {app};
' > app.ts

echo 'import {app} from "./app";

    const port = process.env.PORT || 3000;

    app.listen(port, () => {
        console.log(`Server is running on port: ${port}` );
    });' > index.ts

# Move to the root directory
cd ..

# Open the project in Visual Studio Code
code .

# Start the project
npm run start:dev

