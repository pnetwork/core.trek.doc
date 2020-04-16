#!/usr/bin/env bash
DIR=core.trek.doc
MFLOW_DIR=core.tool.python.mflow
BUILD_MFLOW=$1
BUILD_EXT=$2

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

# copy references from extension repo
if [ "$BUILD_EXT" == "1" ]; then
    echo "build document of vscode extension"
fi

make html
