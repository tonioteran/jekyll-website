#/bin/bash

# Script to move _site contents to github pages repo and push to publish


# Create local build
cd /home/tonio/repos/jekyll-website
bundle exec jekyll build
# Increase the build counter:
echo $(( $(cat buildcounter) + 1 )) > buildcounter

# remove all files from published site:
cd /home/tonio/repos/tonioteran.github.io
git rm -r .
# copy compiled files onto repository
cp -r ../jekyll-website/_site/* .
# add and commit everything
touch .nojekyll
git add .
git commit -m "local build no.$(cat ../jekyll-website/buildcounter)"
git push -u origin master

# return
cd /home/tonio/repos/jekyll-website

echo "DONE!"
echo " "

