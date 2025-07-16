# MLOps Assignment 2: Feature Stores & ML Pipelines

## Objective
The goal of this assignment is to get familiar with using feature stores and building machine learning pipelines. The project was implemented in **Databricks** to leverage its MLOps platform capabilities. The task involves creating multiple feature versions, training models with different hyperparameters, and analyzing the results both quantitatively and qualitatively, including carbon emissions impact.

**Disclaimer:** ChatGPT was used to assist with the development of the ML pipeline and feature store creation.

---

## Project Description
This project focuses on designing a Feature Store integrated with a Machine Learning pipeline, using the dataset `athletes.csv`. The main tasks are:

- Setup an ML pipeline in a chosen MLOps platform.
- Use a feature store within the ML pipeline.
- Create two different feature versions from the dataset.
- Train the same algorithm (XGBoost regressor) using:
  - Two feature versions.
  - Two different hyperparameter sets.
- Run experiments for all 4 combinations.
- Compare the results quantitatively (metrics such as RMSE, R², and CO₂ emissions) and qualitatively (model interpretability using SHAP plots).

---

## Model

- **Algorithm:** XGBoost Regressor
- **Target Variable:** `total lift`
- **Hyperparameter Sets:**
  - Set 1: `n_estimators=100`, `max_depth=3`, `learning_rate=0.1`
  - Set 2: `n_estimators=200`, `max_depth=5`, `learning_rate=0.05`

---

## Dataset Versions

### Version 1
- Columns:
  - gender
  - age
  - height
  - other original features from athletes.csv
- Description: Original feature set without additional engineered or enhanced features.

### Version 2
- Columns:
  - All columns from Version 1, plus:
  - weight
  - additional engineered features (if any)
- Description: Enhanced feature set with additional attributes that improve the model’s predictive power.

---

## Experimental Results

| Version | n_estimators | max_depth | learning_rate | RMSE       | R²       | CO₂ Emissions (kg) |
|---------|--------------|-----------|---------------|------------|----------|--------------------|
| v1      | 100          | 3         | 0.10          | 166.358852 | 0.641063 | 0.000004           |
| v1      | 200          | 5         | 0.05          | 166.543782 | 0.640264 | 0.000004           |
| v2      | 100          | 3         | 0.10          | 26.858388  | 0.990592 | 0.000004           |
| v2      | 200          | 5         | 0.05          | 19.128123  | 0.995228 | 0.000041           |

![Performance Plots](xgb_plots.png)

![Runtimes](xgb_runtimes.png)

---

## Quantitative Analysis
Version 2 of the dataset consistently yielded much lower RMSE values and higher R² scores compared to version 1. The best performing model uses dataset version 2 with the hyperparameters: 200 estimators, max tree depth of 5, and a learning rate of 0.05. This improvement is expected since version 2 includes additional features that enhance predictive capabilities. Across both dataset versions, XGBoost models showed similar performance regardless of hyperparameter configuration, although the second hyperparameter set performed slightly better in version 2 than in version 1. All models exhibited comparably low CO₂ emissions, with the fourth model (v2 with second hyperparameter set) producing marginally higher emissions.

---

## Qualitative Analysis (SHAP Feature Importance)
For models trained on version 1 (models 1 and 2), SHAP plots show that the most important feature is gender "female," while "male" is the least important, with consistent feature importance rankings across both models. For version 2 models (models 3 and 4), which include additional features, "weight" becomes the most important feature while "male" remains the least important. Both version 2 models also share similar feature importance rankings. Overall, adding features in version 2 shifts the model’s focus from gender-based predictors to physical attributes such as weight, reflecting improved interpretability and richer data representation.

---