#!/bin/bash

# command line prompts for uploading different versions of the dataset to LakeFS


# commit original csv 
lakectl fs upload lakefs://mlops-hw/main/athletes.csv -s "C:\Users\anush\Downloads\athletes.csv"
lakectl commit lakefs://mlops-hw/main -m "Add athletes.csv file"


# commit v1 train and test in a v1 folder 
lakectl fs upload lakefs://mlops-hw/main/v1/athletes_v1_train.csv -s "C:\Users\anush\Downloads\athletes_v1_train.csv"
lakectl fs upload lakefs://mlops-hw/main/v1/athletes_v1_test.csv -s "C:\Users\anush\Downloads\athletes_v1_test.csv"
lakectl commit lakefs://mlops-hw/main -m "Upload v1 train/test datasets to v1/ folder"


# commit v2 train and test in a v2 folder
lakectl fs upload lakefs://mlops-hw/main/v2/athletes_v2_train.csv -s "C:\Users\anush\Downloads\athletes_v2_train.csv"
lakectl fs upload lakefs://mlops-hw/main/v2/athletes_v2_test.csv -s "C:\Users\anush\Downloads\athletes_v2_test.csv"
lakectl commit lakefs://mlops-hw/main -m "Upload v2 train/test datasets to v2/ folder"


# display directory structure 
lakectl fs ls lakefs://mlops-hw/main/ --recursive
