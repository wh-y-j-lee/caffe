#!/usr/bin/env sh
# Compute the mean image from the imagenet training lmdb
# N.B. this is available in data/ilsvrc12

EXAMPLE=/HDD/DB/vggface2
DATA=/HDD/DB/vggface2
TOOLS=build/tools

$TOOLS/compute_image_mean $EXAMPLE/vggface2_train \
  $DATA/vggface2_mean.binaryproto

echo "Done."
