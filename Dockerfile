FROM continuumio/miniconda
WORKDIR /usr/src/app
COPY ImageTransferLearning-BigDL/jupyter_notebook_config.py ./
COPY ImageTransferLearning-BigDL/install.sh ./
RUN /bin/bash install.sh
RUN rm ./install.sh

# Install BigDL
ADD zoo ./zoo
COPY ImageTransferLearning-BigDL/install-bigdl.sh ./
RUN /bin/bash install-bigdl.sh
RUN rm ./install-bigdl.sh

COPY ImageTransferLearning-BigDL/install-model.sh ./
RUN /bin/bash ./install-model.sh

COPY ImageTransferLearning-BigDL/jupyter-with-zoo.sh ./
COPY ImageTransferLearning-BigDL/ImageTransferLearning.ipynb ./

ADD demo ./demo

CMD ["/bin/bash", "/usr/src/app/jupyter-with-zoo.sh"]