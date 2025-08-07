# MLOps Assignment 4: Model Monitoring with EvidentlyAI

## Overview

This assignment involves developing a machine learning model to predict `TARGET_deathRate` from a cancer dataset using train/test split methodology. The core focus is on **model monitoring** using the EvidentlyAI platform to detect changes in input data and model outputs after applying systematic modifications to the test dataset.

The work includes training an XGBoost regression model, evaluating its accuracy on the original and modified test sets, and monitoring data drift with EvidentlyAI both locally and on the Evidently Cloud dashboard.

**Disclaimer:** Utilized the help of Chat-GPT to setup the AutoML functions 

---

## Files and Deliverables

### Data/

- `cancer_reg.csv` — Cancer dataset used for training and testing.
- `Data Dictionary.docx` — Data dictionary describing dataset features.

### model_monitoring/

- `model_monitoring.ipynb` — Notebook containing data preprocessing, model training, test set modification, evaluation, and Evidently integration.
- `model_monitoring.html` — Exported HTML report of the notebook.

### reports/

- `report_A.html` — Evidently Data Drift report for test set with median income decreased by $40,000.
- `report_AB.html` — Evidently Data Drift report for test set with median income decreased and poverty percent increased by 20%.
- `report_ABC.html` — Evidently Data Drift report for test set with median income decreased and poverty percent increased and average household sized increased by 2 individuals.

### evidently_dashboard_screenshot.png

- Screenshot of the Evidently Cloud dashboard after uploading the three monitoring reports.

---

## Summary

This assignment shows how changes to key features increased the model’s RMSE compared to the original data. However, EvidentlyAI detected no significant data drift in any modified test sets. These results highlight the need for combining accuracy checks and data monitoring to ensure reliable model performance.

---