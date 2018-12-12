# DeepLearning Chest X-Ray Images

Activities to solve the challenge offered by Kaggle for the identification of pneumonia in radiography images.

The motivation comes from the proposal of Professor Anderson Soares who proposed the challenge in the classroom.

To solve the problem, in this repository contain an artificial machine learning intelligence technique, focused on the recognition of the pattern using deep learning.

## Context
![Context](https://i.imgur.com/jZqpV51.png)

The dataset [(link here)](https://www.kaggle.com/paultimothymooney/chest-xray-pneumonia/downloads/chest-xray-pneumonia.zip/2) is organized into 3 folders (train, test, val) and contains subfolders for each image category (Pneumonia/Normal). There are 5,863 X-Ray images (JPEG) and 2 categories (Pneumonia/Normal).

Chest X-ray images (anterior-posterior) were selected from retrospective cohorts of pediatric patients of one to five years old from Guangzhou Women and Children’s Medical Center, Guangzhou. All chest X-ray imaging was performed as part of patients’ routine clinical care.

For the analysis of chest x-ray images, all chest radiographs were initially screened for quality control by removing all low quality or unreadable scans. The diagnoses for the images were then graded by two expert physicians before being cleared for training the AI system. In order to account for any grading errors, the evaluation set was also checked by a third expert.

## Solution
![Context](https://github.com/marcosvsilva/DeepLearning/blob/master/Docs/AccuracyCurve.png)
![Context](https://github.com/marcosvsilva/DeepLearning/blob/master/Docs/LossCurve.png)

A deep neural network was implemented using the transfer learning resources, using the InceptionV3 network. The parameters used can be visualized in the implementation of the network architecture itself.

It was also used an external data augumentation, with the use of a software implemented and matlab containing the source code also in this solution, which performs the work of enlarging the dataset which for the problem was classified as small, mainly in the part of images where no pneumonia.

As a measure, we were able to achieve an accuracy of 88% in the pro dataset test set with the training curve expressed above. This was not influenced by data augumentation.
