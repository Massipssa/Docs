# Basics

1. [Basics](#basics)
2. [Overfitting](#overfitting)

## Basics <a name="basics"></a>

- **Supervised Learning**

Based on historical data that has labels, train a model to predict the values of labels (dependent variable) based on features.
Example: Predict person income (labels) based on the age (feature)

- Two groups of supervised learning
  - **Classification:** train an algorithm to predict a dependent variable that is **categorical** (beloging to discrete, finite set of values)
    - Binary classification
    - Multiple classification
  - ***Regression:*** predict on continuous variable

- **Recommendation engines:**
  - Suggest based on the behavior
  - Ex: based on the rating, suggest to customer the product
- **Unsupervised Learning:** try to find a patterns or discover the underlying structure in a given data set
  - Clustering
  - Anomaly detection
  - Topic modeling

## Overfitting <a name="overfitting"></a>

- Model is unable to generalize with new data
- Causes
  - Not enough training data
  - Too many feature (Too complex model)
  - Model fited too necessary features **Noise**

- Solutions
  - Mode data
  - Make model less complex
  - Remove noise from the model by **increasing the regularization** parameters

- What's regularization ?

- Wide neural and Deep neural ?
  - Wide models are used for memorization. Deep models are for generalization
  - Deep and wide models are ideal for a recommendation application.
