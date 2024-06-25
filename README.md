# arcsi-docker
Files to build docker image that will run [ARCSI](http://remotesensing.info/arcsi/) developed by Pete Bunting &amp; Dan Clewley for Atmospheric &amp; Radiometric correction of satellite imagery. 

## Instructions 
Docker needs to be installed. Pull the container with the following command. 

`docker pull bcol845/arcsi`

To initialise the container run the following command. Use the `--volume/-v` flag to mount the directory that contains the input data to be proccessed. The following command mounts to a directory in the container called `/data`. This command will initialise a terminal session inside the container activating a conda environment with ARCSI installed. 

`docker run -it -v /local/file/path/to/input/data:/data`

Instructions for working with ARCSI can be found at the ARCSI [website](http://remotesensing.info/arcsi/).
