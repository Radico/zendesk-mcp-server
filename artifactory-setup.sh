#!/bin/bash

# This script helps set up authentication for Artifactory

# Check if NPM_TOKEN is set
if [ -z "$NPM_TOKEN" ]; then
  echo "Please enter your Artifactory API token:"
  read -s NPM_TOKEN
  export NPM_TOKEN
fi

# Configure npm to use Artifactory
npm config set @simon:registry https://simondata.jfrog.io/artifactory/api/npm/npm-local/

# Create or update .npmrc in the home directory
cat > ~/.npmrc << EOF
@simon:registry=https://simondata.jfrog.io/artifactory/api/npm/npm-local/
//simondata.jfrog.ip/artifactory/api/npm/npm-local/:_authToken=${NPM_TOKEN}
EOF

echo "Artifactory configuration complete!"
echo "You can now publish packages to Artifactory using 'npm run publish:artifactory'"