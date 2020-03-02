#!/bin/bash

#Set home Directory
cd /home/tjalle/gitPush/scripts

#Run different scripts
sudo ./zsh.sh

#Run Git Commit
cd ..
git add .
git commit
git push origin master
