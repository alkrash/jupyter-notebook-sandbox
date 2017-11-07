# Run Jupyter notebook Server in a VirtualBox

## Provision the virtual box instance 

* VirtualBox and Vagrant will need to be installed on the host machine before proceeding
* Provision a new VirtualBox box using `Vagrantfile` provided, run

`vagrant up`

## ssh to the virtual box

`vagrant ssh`

## Configure the notebook server password 

* In vagrant home configure run the following command to set the password

`jupyter notebook password`

* enter and confirm password when prompted

* A file containing a hashed value of the password is placed in jupyter config directory

`~/.jupyter/jupyter_notebook_config.json`


## Run the single-user notebook server

* A default Jupyter configuration file `~/.jupyter/jupyter_notebook_config.py` has been created modified to run jupyter notebook in the single-user server mode
* To start the notebook server type 

`jupyter notebook`

* Once the server has been started, the notebook can be accessed with the browser on the HOST machine

`http://localhost:8888`

* In the splash screen enter the password created in the previous step






