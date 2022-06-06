#!/bin/bash

rsync --progress --ignore-existing -azr  /mnt/Important/Dad dezire@pi.hole:/mnt/external/shared/
