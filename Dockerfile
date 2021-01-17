# Base Image
FROM jupyter/base-notebook:python-3.8.6

# Maintainer
LABEL maintainer "Haruki Kondo"

# Configure environment
ENV CONDA_DIR=/opt/conda \
    NB_USER=jovyan
    
# Install Jupyter Notebook and Hub
RUN conda install --quiet --yes \
    'numpy=1.17.*' \
    'scipy=1.5.*' \
    'sympy=1.5.*' \
    'matplotlib=3.1.*' \
    && conda clean -tipsy && \
    fix-permissions $CONDA_DIR

# Install Sample Notebook
COPY sample_notebook/CavityFlow_with_Navier-Stokes.ipynb /home/$NB_USER/
