#!/usr/bin/env sh
# Create the imagenet lmdb inputs
# N.B. set the path to the imagenet train data dirs
set -e

EXAMPLE=/HDD/DB/vggface2
DATA=/HDD/DB
TOOLS=build/tools

TRAIN_DATA_ROOT=/HDD/DB/VGG_Face_maxpy_mtcnnpy_160/

# Set RESIZE=true to resize the images to 224x224. Leave as false if images have
# already been resized using another tool.
RESIZE=true
if $RESIZE; then
  RESIZE_HEIGHT=224
  RESIZE_WIDTH=224
else
  RESIZE_HEIGHT=0
  RESIZE_WIDTH=0
fi

if [ ! -d "$TRAIN_DATA_ROOT" ]; then
  echo "Error: TRAIN_DATA_ROOT is not a path to a directory: $TRAIN_DATA_ROOT"
  echo "Set the TRAIN_DATA_ROOT variable in create_imagenet.sh to the path" \
       "where the ImageNet training data is stored."
  exit 1
fi

echo "Creating train lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --encode_type="png" \
    --shuffle \
    $TRAIN_DATA_ROOT \
    $DATA/train.txt
    $EXAMPLE/vggface2_train_lmdb

echo "Done."
