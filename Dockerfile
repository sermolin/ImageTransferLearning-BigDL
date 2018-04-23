FROM continuumio/miniconda
WORKDIR /usr/src/app
COPY jupyter_notebook_config.py ./
COPY install.sh ./
RUN /bin/bash install.sh
RUN rm ./install.sh
COPY start-notebook ./
WORKDIR /host
CMD ["/bin/bash", "/usr/src/app/start-notebook"]