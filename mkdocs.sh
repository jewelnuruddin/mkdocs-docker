#!/bin/sh

# This script dose not create docker image,
# will only work on existing docker image.

# Usages of this script and help
function usage {
        echo "./mkdocs.sh -p produce -l local_dir_name -n image_name"
        echo "./mkdocs.sh -s serve -l local_dir_name -n image_name"
        exit 3
}

# If no parameters are supply with this script
if [ $# -eq 0 ] ; then
     usage
fi

# Getting parameters
while getopts "p:s:l:n:h" OPT; do
	case $OPT in
                p) produce=$OPTARG;;
                s) serve=$OPTARG;;
		l) path=$OPTARG;;
		n) image_name=$OPTARG;;
		h) usage;;
	esac
done
shift $((OPTIND -1))

# Check whether it produce, if "produce" then it will
# attached a local volume and create MkDocs contents
# inside container image and exit.
# We should be able to see local directory that contains the Mkdocs project.
if [ "$produce" == "produce" ] ; then
      docker run -d -v "$(pwd)/$path":/projects $image_name mkdocs new .
      exit 0
fi

# If the parameter is serve then local directory which contains MkDocs project
# will attached container image and run MkDocs project
if [ "$serve" == "serve" ] ; then
      docker run -p 8000:8000 -v "$(pwd)/$path":/projects $image_name mkdocs serve --dev-addr=0.0.0.0:8000
fi
