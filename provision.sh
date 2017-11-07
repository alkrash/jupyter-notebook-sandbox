#! /bin/bash

###############################################################################
# Edit Anaconda version and install location
###############################################################################
VAGRANT_HOME="/home/vagrant"
ANACONDA3_VERSION=5.0.1
ANACONDA3_HOME="$VAGRANT_HOME/anaconda"

###############################################################################
# Run system update
###############################################################################
sudo apt-get update

###############################################################################
# Configure anaconda for vagrant user
###############################################################################
sudo su - vagrant <<EOF

    # download and run Anaconda installation 
    wget https://repo.continuum.io/archive/Anaconda3-$ANACONDA3_VERSION-Linux-x86_64.sh
    bash ./Anaconda3-$ANACONDA3_VERSION-Linux-x86_64.sh -b -p $ANACONDA3_HOME
    
    echo "export PATH=$PATH:$ANACONDA3_HOME/bin" >> .bashrc
    
    rm ./Anaconda3-$ANACONDA3_VERSION-Linux-x86_64.sh
    
    # Get latest conda packages
    $ANACONDA3_HOME/bin/conda update conda

    # Generate jupyter config 
    $ANACONDA3_HOME/bin/jupyter notebook --generate-config --config ~/.jupyter/jupyter_notebook_config.py

    # Run notebook app on '0.0.0.0' - this will run Notebook as a single-user server
    # Don't run the default browser when starting the notebook app
    sed -i.bak \
        -e 's/#c\.NotebookApp\.ip =.*/c\.NotebookApp\.ip = '\''0\.0\.0\.0'\''/' \
        -e 's/#c\.NotebookApp\.open_browser =.*/c\.NotebookApp\.open_browser = False/' \
        ~/.jupyter/jupyter_notebook_config.py
EOF
