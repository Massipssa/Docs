# AI platform

- Component of distributed model
    - **Master:** manages other nodes
    - **Workers:** works on the portion of the training
    - **Parameters server:** coordinates shaded model state between worker

- Types of predictions
    - **Online**
        - Real-time processing with fully managed ML Engine
        - No Docker container required & supports multiple framework
    - **Batch**
        - For asynchronous operations
        - Scales to terabytes of data
- Terminolgy
    - Model
    - Version: instance of model
    - Job: interaction with AI Platform

## IAM Roles

- Project and Model roles
    - Admin
    - Developer
    - Viewer
- Model Only roles
    - Model Owner: full access to model and versions
    - Model User:
        - Read models and use for prediction
        - Easy to share specific models

## Machine scale

- BASIC
- STANDARD_1
- PREMIUM_1
- BASIC_GPU
- CUSTOM

- GPU(Graphic Processing Unit) /TPU (Tensor Processing Unit)