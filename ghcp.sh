#!/bin/bash

# Input args:
source_repo=$1        # Repo to clone initially.
new_repo_local=$2     # New name for the repo (new local folder)
target=$3             # Name/organization+name for the repo

# Clone source repo
git clone $source_repo

echo "Copy the source folder to the new destination..."

directory=$(basename -- "$source_repo")

source=${PWD}/"${directory%.*}"
cd ..
new_repo=${PWD}/$target

echo "Copy from <${source}> to <${new_repo}>"
cp -r $source $new_repo

echo "Remove .git if already present..."

git_directory=$new_repo/".git"

if [ -d "$git_directory" ]; then
    echo "Removing ${git_directory} to create a new repo."
    rm -rf $git_directory
else
    echo "No .git folder was found, nothing to remove."
fi


echo "Create and push the new repo..."

echo "repo_name: ${target}"

cd ${new_repo}

# Initialize and create repo in github from the copied folder
git init
gh repo create --confirm --private ${target}
git add .
git commit -m "automatic commit from ghcp.sh"
git push -u origin master
