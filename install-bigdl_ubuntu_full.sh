#/bin/bash
# this script installs BigDL 0.5 and all necessary dependencies as well as
#Ubuntu remote desktop X2GO server. It was tested on Azure Ubuntu server 16.04 LTS
#Strictly speaking, this is not an executable script since some Java
#installation commands requrie non-trivial keyboard prompting. However once you
#get past java installation, you can let it run

#source activate py35

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer    # needs propmpts on gui-like screen
sudo apt-get install oracle-java8-set-default
java -version
sudo wget http://mirrors.ibiblio.org/apache/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz
sudo tar xvzf spark-2.2.0-bin-hadoop2.7.tgz
rm spark-2.2.0-bin-hadoop2.7.tgz
sudo apt-get install maven
# We don’t have *.zip distribution for this version of BiDL yet, so need to build:
# the repo is protected by 2-factor authentication. to get around it, you need to generate a token
# Profile->Settings->DeveloperSettings->PersonalAccessTokens->GenerateNewToken (make sure to check the "repo" checkbox at the top.
git clone repo github.com/intel-analytics/zoo
#enter username and paste tocken in place of the password
git submodule update --init --recursive

#On my system, the repo is placed in /Users/svermoli/Documents/GigHub/intel-analytics/zoo
#In this directory issue command to build BigDL:

bash make-dist.sh -P spark_2.x

#BigDL jars are placed in /Users/svermoli/Documents/GigHub/intel-analytics/zoo/dist (!caution #- note that htere is also zoo/zoo/dist/target directory. that's not the one you want)

# installing needed python componets
 sudo apt-get update && sudo apt-get -y upgrade
 sudo apt-get install python-pip 
 sudo pip install jupyter numpy six
# installing X2GO and Firefox  
 sudo add-apt-repository ppa:x2go/stable
 sudo apt-get update
 sudo apt-get install x2goserver x2goserver-xsession
 sudo apt-get install xfce4
 sudo service x2goserver start
 sudo apt-get install firefox

# Setting environment variables 
export SPARK_HOME=/Users/svermoli/spark-2.2.0-bin-hadoop2.7
export ZOO_HOME=/Users/svermoli/Documents/GitHub/intel-analytics/zoo/dist

# downloading datasets and model for Transfer learning example
#please, note that will need to edit Jupyter notebook to proide pointers to the dataset and model
# this exmple uses Kaggle's 'cats vs dogs'. For house style transfer learning, you need to provide a different dataset.
#Download the training dataset from https://www.kaggle.com/c/dogs-vs-cats and extract it. #Example: place the dataset into /Users/svermoli/sandbox/dogsvscats/demo/
#We found it easier to login to Kaggle via Firefox, download and unzip the dataset from 
#within the VM rather than utilize Kaggle's CLI.
#The following commands copy 1000 images of cats and dogs into demo/cats and demo/dogs separately.
$mkdir -p demo/dogs
$mkdir -p demo/cats
$find train/ -type f | grep -i cat | head -1000 | xargs -i cp {} demo/cats
$find train/ -type f | grep -i dog | head -1000 | xargs -i cp {} demo/dogs
#download pre-trained inception model
mkdir model 
cd model 
wget https://s3-ap-southeast-1.amazonaws.com/bigdl-models/imageclassification/imagenet/bigdl_inception-v1_imagenet_0.4.0.model
cd ~/GitHub/intel-analytics/zoo
#tLaunch Jupyter notebook which you can open in Firefox via provided URL such as http://localhost:7000/ 
bash ./scripts/jupyter-with-zoo.sh 
