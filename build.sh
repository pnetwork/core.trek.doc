#!/usr/bin/env bash
DIR=core.trek.doc
MFLOW_DIR=core.tool.python.mflow
BLKCS_SDK_DIR=core.sdk.python.blcks
BUILD_MFLOW="0"
BUILD_EXT="0"
BUILD_BLCKS="0"

while test $# -gt 0; do
  case "$1" in
    -h|--help)
      echo "Document Gererator"
      echo " "
      echo "options:"
      echo "-h, --help                show brief help"
      echo "--mflow                   build from mflow repo"
      echo "--vse                     build from Vscode extension repo"
      echo "--blcks                   build from blcks sdk repo"
      exit 0
      ;;
    --mflow)
      BUILD_MFLOW="1"  
      shift
      ;;
    --vse)
      BUILD_EXT="1"
      shift
      ;;
    --blcks)
      BUILD_BLCKS="1"  
      shift
      ;;
    *)
      break
      ;;
  esac
done

make clean

# copy references from mflow repo
if [ "$BUILD_MFLOW" == "1" ]; then
    echo "build document of mflow"
    cd ../$MFLOW_DIR
    pip install -r requirements-docs.txt
    cd docs
    make html
    cd ../../$DIR
    cp -r ../$MFLOW_DIR/docs/reference/commands ./source/reference/clikit/
    # cp ../$MFLOW_DIR/docs/guide/quickstart.rst ./source/reference/clikit/quickstart.rst
fi

# copy references from blcks sdk repo
if [ "$BUILD_BLCKS" == "1" ]; then
    echo "build document of blcks sdk"
    cd ../$BLKCS_SDK_DIR
    pip install -r requirements-docs.txt
    python setup.py build
    python setup.py install
    cd docs
    make html
    cd ../../$DIR
    # cp -r ../$BLKCS_SDK_DIR/docs/reference/clients ./source/reference/blcks
    cp -r ../$BLKCS_SDK_DIR/docs/reference/services ./source/reference/blcks
    cp ../$BLKCS_SDK_DIR/docs/guide/installation.rst ./source/reference/blcks/installation.rst
    cp ../$BLKCS_SDK_DIR/docs/guide/quickstart.rst ./source/reference/blcks/quickstart.rst
fi

# copy references from extension repo
if [ "$BUILD_EXT" == "1" ]; then
    echo "build document of vscode extension"
fi

make html

# .nojekyll
touch ./build/html/.nojekyll
