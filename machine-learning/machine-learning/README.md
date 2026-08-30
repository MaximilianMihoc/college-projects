# Machine Learning Coursework

A collection of Python assignments covering data preparation, supervised classification, model comparison, decision trees, and the Kaggle Titanic challenge.

## Projects

### Assignment 1 — data quality and preparation

Examines a supplied dataset and feature description, separates continuous and categorical variables, profiles distributions and missing values, detects data-quality issues, and writes cleaned or transformed CSV files. The accompanying PDF/DOCX reports preserve the analysis and conclusions.

### Assignment 2 — classification experiments

Builds and compares several scikit-learn classifiers over training and query datasets:

- k-nearest neighbours, including feature scaling and neighbour selection;
- random forests and feature-importance analysis;
- support-vector machines;
- decision-tree experiments and generated predictions.

The scripts include data-reporting utilities, alternate experiments, prediction files, and the submitted solution output.

### Decision Tree Challenge

`DecisionTreeChallenge/` contains a compact, separate decision-tree classification exercise using provided training and test text files.

### Kaggle Titanic Challenge

The Jupyter notebook explores passenger data, prepares features, trains a survival model, and writes `prediction.csv` in Kaggle's submission format.

## Technologies and skills

Python, pandas, NumPy, matplotlib, Jupyter, and scikit-learn; exploratory data analysis; categorical and continuous feature handling; train/test workflows; classifier evaluation; and prediction export.

## Running it today

Open the Titanic notebook with Jupyter. The assignment scripts expect their data files at the relative paths used in the source and were written against older Python/scikit-learn APIs, so current environments may require import or API adjustments. The repository intentionally retains submitted datasets, reports, and solution files as a record of the coursework.
