#!/bin/bash

# command line prompts for uploading different versions of the dataset to GitLFS

# create a local repository and enable tracking (.gitattributes folder)
cd "C:\Users\anush\Downloads"
mkdir athletes-data
cd athletes-data
git init
git lfs install
git lfs track "*.csv"


# copy csvs into the local repo 
copy ..\athletes.csv .
mkdir v1
copy ..\athletes_v1_*.csv v1\
mkdir v2
copy ..\athletes_v2_*.csv v2\

# commit files to git
git add .gitattributes
git add .
git commit -m "Add all CSV datasets using Git LFS"


# create mlops_data private repo on github and push 
git remote add origin https://github.com/abhat09/mlops_data.git
git push -u origin master
