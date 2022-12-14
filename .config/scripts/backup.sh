#!/bin/bash

rsync --progress --ignore-existing -avzr dezire@pi4:/mnt/external/docker /mnt/Important/
rsync --progress --ignore-existing -azvr  /mnt/Important/Dad dezire@pi4:/mnt/external/shared/

#delete the files not present in the source dir

rsync --progress --ignore-existing --delete-after -azvr  /mnt/d/Dad dezire@pi:/mnt/external/shared/ 
