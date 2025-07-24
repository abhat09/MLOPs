# MLOps Assignment 3: AutoML 

## Overview

The goal of this assignment is to leverage two different AutoML platforms — **PyCaret** and **H2O AutoML** — to analyze the Athletes dataset and identify the best predictive models. This includes comparing model performance, feature importance, and training speed using both all available features and subsets of the top features.

The work was done using Google Colab.

---

## Files and Deliverables

### `AutoML.py`

- Loads and preprocesses the Athletes dataset.
- Runs PyCaret's regression AutoML pipeline to:
  - Automatically compare multiple regression models.
  - Identify the best model based on validation metrics.
- Extracts the top 5 important features.
- Reports:
  - Top 3 models by validation score using all features and top features.
  - Top 3 models by training speed using all features and top features.
- Compares PyCaret AutoML results to previous models.
- Demonstrates PyCaret as a low-code AutoML platform.

### 'H20.py`

- Loads and preprocesses the Athletes dataset into H2O's environment.
- Runs H2O AutoML to:
  - Automatically build and compare multiple models.
  - Identify the best model based on validation metrics.
- Extracts and reports the top 5 important features.
- Creates a reduced dataset with the top 3 features and reruns AutoML.
- Reports:
  - Top 3 models by validation score using all features and top features.
- Demonstrates H2O AutoML as a flexible low-code AutoML platform.

---

## Summary

This assignment showcases how AutoML tools can accelerate model development on real datasets. Both PyCaret and H2O AutoML identified strong ensemble models, highlighted key predictive features, and provided valuable insights into model performance and training times. The comparison across platforms illustrated differences in ease of use, flexibility, and efficiency, helping to understand the trade-offs between no-code, low-code, and full-code AutoML solutions.

---
