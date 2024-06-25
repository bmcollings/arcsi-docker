# arcsi-docker
Files to build docker image that will run [ARCSI](http://remotesensing.info/arcsi/) developed by Pete Bunting &amp; Dan Clewley for Atmospheric &amp; Radiometric correction of satellite imagery. 

## Instructions 
Docker needs to be installed. To initialise the container run the following command. Use the `--volume/-v` flag to mount the directory that contains the input data to be proccessed. The following command mounts to a directory in the container called `/data`

`docker run -it -v /local/file/path/to/input/data:/data`

Instructions for working with ARCSI can be found at the ARCSI [website](http://remotesensing.info/arcsi/).
