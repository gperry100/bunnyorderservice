#!/bin/bash

# compile the templated properties file, if not already
FILE_NAME=bunnyorderservice.properties
PROPERTIES_FILE=/opt/mule/conf/$FILE_NAME
if [ ! -f $PROPERTIES_FILE ] ; then
	echo "Replacing $PROPERTIES_FILE"
	erb /build/$FILE_NAME.erb > $PROPERTIES_FILE
	chown mule $PROPERTIES_FILE
fi

echo "Starting Mule CE Server"
exec mule
