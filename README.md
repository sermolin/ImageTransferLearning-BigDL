# ImageTransferLearning-BigDL
# it is based on https://github.com/intel-analytics/zoo/tree/master/pyzoo/zoo/examples/nnframes/ImageTransferLearning

    2  sudo add-apt-repository ppa:webupd8team/java

    3  sudo apt-get update

    4  sudo apt-get install oracle-java8-installer    # needs propmpts on gui-like screen

    5  sudo apt-get install oracle-java8-set-default

    6  java -version

    7  sudo wget http://mirrors.ibiblio.org/apache/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz

    8  sudo tar xvzf spark-2.2.0-bin-hadoop2.7.tgz

    9  rm spark-2.2.0-bin-hadoop2.7.tgz
    10 sudo apt-get install maven
    
 

# We don’t have *.zip distribution for this version of BiDL yet, so need to build:
# the repo is protected by 2-factor authentication. to get around it, you need to generate a token
# Profile->Settings->DeveloperSettings->PersonalAccessTokens->GenerateNewToken (make sure to check the "repo" checkbox at the top.

git clone repo github.com/intel-analytics/zoo
#enter username and paste tocken in place of the password
git submodule update --init --recursive

On my system, the repo is placed in /Users/svermoli/Documents/GigHub/intel-analytics/zoo

In this directory issue command to build BigDL:

$bash make-dist.sh -P spark.2.x

BigDL jars are placed in /Users/svermoli/Documents/GigHub/intel-analytics/zoo/dist (!caution - note that htere is also zoo/zoo/dist/target directory. that's not the one you want)

export SPARK_HOME=/Users/svermoli/spark-2.2.0-bin-hadoop2.7

export ZOO_HOME=/Users/svermoli/Documents/GitHub/intel-analytics/zoo/dist

-------
Download the training dataset from https://www.kaggle.com/c/dogs-vs-cats and extract it. Example: place the dataset into /Users/svermoli/sandbox/dogsvscats/demo/
The following commands copy 1000 images of cats and dogs into demo/cats and demo/dogs separately.
$mkdir -p demo/dogs
$mkdir -p demo/cats
$find train/ -type f | grep -i cat | head -1000 | xargs -i cp {} demo/cats
$find train/ -type f | grep -i dog | head -1000 | xargs -i cp {} demo/dogs
Download the pre-trained Inception-V1 model from Zoo:https://s3-ap-southeast-1.amazonaws.com/bigdl-models/imageclassification/imagenet/bigdl_inception-v1_imagenet_0.4.0.model and place in (example) /Users/svermoli/sandbox/dogsvscats/model/bigdl_inception-v1_imagenet_0.4.0.model
------
Command-line to launch Jupiter notebook: 
$./scripts/jupyter-with-zoo.sh

# Steps to deploy on Azure Ububtu 16.04 VM#

 sudo add-apt-repository ppa:webupd8team/java
 
 sudo apt-get update
 
 sudo apt -get install sudo apt-get install oracle-java8-installer
 
 sudo apt-get install oracle-java8-installer
 
 sudo apt-get install oracle-java8-set-default
 
 sudo wget http://mirrors.ibiblio.org/apache/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz
 
 sudo tar xvzf spark-2.2.0-bin-hadoop2.7.tgz
 
 rm spark-2.2.0-bin-hadoop2.7.tgz
 
 mkdir GitHub
 
 cd GitHub/
 
 sudo apt-get install git
 
 git clone https://github.com/intel-analytics/zoo
 
 cd zoo/
 
 git submodule update --init --recursive
 
 sudo apt-get install maven
 
 bash make-dist.sh -P spark.2.x
 
 cd ../..
 
 git clone https://github.com/sermolin/ImageTransferLearning-BigDL
  
 export SPARK_HOME=/home/sermolin/spark-2.2.0-bin-hadoop2.7
 
 export ZOO_HOME=/home/sermolin/GitHub/intel-analytics/zoo/dist
 
 cd intel-analytics/zoo/scripts/
 
 ls ../../../ImageTransferLearning-BigDL/jupyter-with-zoo.sh
 
 cp ../../../ImageTransferLearning-BigDL/jupyter-with-zoo.sh .
 
 mkdir model
 
 cd model
 
 wget https://s3-ap-southeast-1.amazonaws.com/bigdl-models/imageclassification/imagenet/bigdl_inception-v1_imagenet_0.4.0.model
 
 sudo apt-get update && sudo apt-get -y upgrade
 sudo apt-get install python-pip
  
 sudo pip install jupyter numpy six
 
 sudo add-apt-repository ppa:x2go/stable
 
 sudo apt-get update
 
 sudo apt-get install x2goserver x2goserver-xsession
 
 sudo apt-get install xfce4
 
 sudo service x2goserver start
 
 sudo apt-get install firefox

 
Connect via remote desktop (X2GO client), start firefox, navigate to https://www.kaggle.com/c/dogs-vs-cats, login and download train.zip dataset. Place train.zip into /home/sermolin/demo

mkdir demo

cd demo/

unzip train.zip

mkdir -p demo/dogs 

mkdir -p demo/cats 

find train/ -type f | grep -i cat | head -1000 | xargs -i cp {} demo/cats 

find train/ -type f | grep -i dog | head -1000 | xargs -i cp {} demo/dogs

rm -rf train (important to remove 'train' directory)
   
Now you are ready to launch the notebook:

sermolin@dockera:~/GitHub/intel-analytics/zoo$ ./scripts/jupyter-with-zoo.sh



