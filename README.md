# ImageTransferLearning-BigDL
# Docker-based distribution of HouseTransferLearning.ipynb notebook. Based on https://github.com/intel-analytics/zoo/tree/master/pyzoo/zoo/examples/nnframes/ImageTransferLearning and Alex Kalinin's https://github.com/alex-kalinin/lenet-bigdl
## In this Spark BigDL-based python example, we train a model to recognize four different house styles (Modern, Contemporary, Ranch, and Mediterranean) and then validate our model on a holdout dataset. 
### intall-bigdl_ubuntu_full.sh is a pseudo-script that walks you through manual installation of BigDL on bare-metal Azure Ubunutu Server 16.04. It is not necessary to execute all steps, but this is a good coprehensive example of the installation procedure.
### HouseStyleTransferLearning.ipynb is a house-style transfer learning example
### ImpageTransferLearningDCa.ipynb is a tried-and-true transfer learning example based on Kaggle's cats-and-dogs dataset.

This build is designed to produce and AMI image which generates 20 docker containers that can be accessed via http://URL:port_number and is targeted towards a deep learning workshops.
We will add docker build and AMI instructions later. 
