#!/bin/bash

# This script will be run by a Hesos docker container

mv dist/*.egg sklearn.egg

if [ $(aws s3 sync . s3://hobsons-datascience/retention_modeling/eggs/ --exclude "*" --include "sklearn.egg" | cat -v | grep '\^Mupload: \./sklearn\.egg' | wc -l) -gt 0 ]
then
    touch _NEW_SKLEARN_EGG
    aws s3 cp _NEW_SKLEARN_EGG s3://hobsons-datascience/retention_modeling/eggs/
fi