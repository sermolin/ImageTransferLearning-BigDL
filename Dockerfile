FROM continuumio/miniconda
WORKDIR /usr/src/app
COPY jupyter_notebook_config.py ./
COPY install.sh ./
RUN /bin/bash install.sh
RUN rm ./install.sh

# Install BigDL
COPY install-bigdl.sh ./ 
RUN /bin/bash install-bigdl.sh
RUN rm ./install-bigdl.sh

COPY jupyter-with-zoo.sh ./
COPY ImageTransferLearning.ipynb ./

WORKDIR /host
CMD ["/bin/bash", "/usr/src/app/jupyter-with-zoo.sh"]