# MLOps Assignment 1: Data Version Control

## Overview

The goal of this assignment is to utilize two different data versioning tools — **lakeFS** and **Git LFS** — to manage datasets used in a linear regression modeling workflow. This includes handling datasets with and without differential privacy.

Disclaimer: Utilized the help of Chat-GPT for setting up the LakeFS and GitLFS connections.
---

## Files and Deliverables

### `Cleaning_EDA_Modeling.ipynb`

- Cleans and preprocesses the `athletes` dataset.
- Performs exploratory data analysis (EDA).
- Creates **Version 1** by performing basic train/test split.
- Creates **Version 2** by:
  - Removing outliers.
  - Creating new features.
  - Handling missing values.
- Trains and evaluates two linear regression models — one on each dataset version.

### `lakefs_commands.sh`

- Bash script containing commands to:
  - Create repository and branches on **lakeFS**.
  - Upload versioned train/test CSVs using the `lakectl` CLI.
- Data is stored in an Amazon S3 bucket via lakeFS.

### `gitlfs_commands.sh`

- Bash script containing commands to:
  - Track large CSV files using **Git LFS**.
  - Add and commit files to a local Git repo.
  - Push the files to GitHub.
- Useful for smaller-scale projects requiring versioning via Git.

### `dp_model.ipynb`

- Trains a linear regression model using **differential privacy** via TensorFlow Privacy.
- Compares performance with non-private model.
- Executed on **Google Cloud** for scalability.

### `comparison_slides.ppt`

- Slides comparing:
  - lakeFS vs. Git LFS for data versioning.
  - Model performance on versioned data.
  - Accuracy trade-offs with differential privacy.

---

## LakeFS Repository

Data versioning was handled using the `lakectl` CLI tool.

- **Repository Name:** `mlops-hw`
- **Storage Backend:** Amazon S3 (via lakeFS)
- **Default Branch:** `main`

### Folder Structure

mlops-hw/
├── main/
│ ├── athletes.csv
│ ├── v1/
│ │ ├── athletes_v1_train.csv
│ │ └── athletes_v1_test.csv
│ └── v2/
│ ├── athletes_v2_train.csv
│ └── athletes_v2_test.csv

- **Repository Overview:**

  ![LakeFS Repository](pics_read/lakefs_repo.png)

- **Directory View of `main` Branch:**

  ![LakeFS Directory](pics_read/lakefs_directory_structure.png)

---

## GitLFS Repository

Data versioning was handled using the `gitlfs` CLI tool.

- **Repository Name:** `mlops-data`
- **Storage Backend:** GitLFS 
- **Default Branch:** `master`

### Folder Structure

mlops-data/
├── main/
│ ├── athletes.csv
│ ├── v1/
│ │ ├── athletes_v1_train.csv
│ │ └── athletes_v1_test.csv
│ └── v2/
│ ├── athletes_v2_train.csv
│ └── athletes_v2_test.csv

- **Repository Overview:**

  ![GitLFS Repository](pics_read/gitlfs_repo.png)

- **Tracker View of CSV Files:**

  ![GitLFS Tracker](pics_read/gitlfs_tracker.png)