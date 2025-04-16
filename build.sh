#!/bin/bash

# Clean the dist directory
rm -rf dist

# Create the dist directory
mkdir -p dist

# Copy all files from src to dist
cp -r src/* dist/

# Ensure the index.js file is executable
chmod +x dist/index.js

echo "Build completed successfully!"