#!/usr/bin/env bash
DIR=core.trek.doc
TREK_DIR=core.tool.python.mflow
BLKCS_SDK_DIR=core.sdk.python.blcks
VSCODE_EXTENSION_DIR=core.vscode.extension.mflow
BUILD_TREK="0"
BUILD_EXT="0"
BUILD_BLCKS="0"

while test $# -gt 0; do
  case "$1" in
    -h|--help)
      echo "Document Gererator"
      echo " "
      echo "options:"
      echo "-h, --help                show brief help"
      echo "--trek                    build from trek repo"
      echo "--vse                     build from VSCode extension repo"
      echo "--blcks                   build from blcks sdk repo"
      exit 0
      ;;
    --trek)
      BUILD_TREK="1"  
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

# copy references from trek repo
if [ "$BUILD_TREK" == "1" ]; then
    echo "build document of trek"
    cd ../$TREK_DIR
    pip install -r requirements-docs.txt
    cd docs
    make html
    cd ../../$DIR
    cp -r ../$TREK_DIR/docs/reference/commands ./source/reference/cli/
    cp ../$TREK_DIR/CHANGELOG.md ./source/reference/cli/CHANGELOG.md
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
    cp -r ../$BLKCS_SDK_DIR/docs/_static/images ./source/_static/
    cp -r ../$BLKCS_SDK_DIR/docs/reference/services ./source/reference/blcks
    cp ../$BLKCS_SDK_DIR/docs/guide/installation.rst ./source/reference/blcks/installation.rst
    cp ../$BLKCS_SDK_DIR/docs/guide/configuration.rst ./source/reference/blcks/configuration.rst
    cp ../$BLKCS_SDK_DIR/docs/guide/quickstart.rst ./source/reference/blcks/quickstart.rst
fi

# copy references from trek vscode extension repo
if [ "$BUILD_EXT" == "1" ]; then
    echo "build document of trek vscode extension"
    cd ../$VSCODE_EXTENSION_DIR
    pip install -r requirements-docs.txt
    cd docs
    make html
    cd ../../$DIR
    cp -r ../$VSCODE_EXTENSION_DIR/docs/reference/commands ./source/reference/extension/
    cp ../$VSCODE_EXTENSION_DIR/CHANGELOG.md ./source/reference/extension/CHANGELOG.md
fi

# copy references from extension repo
if [ "$BUILD_EXT" == "1" ]; then
    echo "build document of vscode extension"
fi

make html

# .nojekyll
touch ./build/html/.nojekyll
