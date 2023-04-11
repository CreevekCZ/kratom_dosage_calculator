#!/bin/bash

# Replace "<base href="$FLUTTER_BASE_HREF">" with "<base href="./">" in web/index.html
sed -i.bak 's#<base href="\$FLUTTER_BASE_HREF">#<base href="./">#g' web/index.html
rm -rf web/index.html.bak

# Build the web project using flutter
flutter build web --release

# Replace "<base href="./">" with "<base href="$FLUTTER_BASE_HREF">" in web/index.html
sed -i.bak 's#<base href="./">#<base href="\$FLUTTER_BASE_HREF">#g' web/index.html
rm -rf web/index.html.bak

# Clear content of docs folder
rm -rf docs/*

# Copy content of build/web folder to docs folder
cp -r build/web/. docs/
chmod 777 docs/*

echo "Build completed successfully"