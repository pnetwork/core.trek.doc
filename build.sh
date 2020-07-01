#!/usr/bin/env bash
#!/bin/bash
DIR=core.trek.doc
TREK_DIR=core.tool.python.mflow
BLKCS_SDK_DIR=core.sdk.python.blcks
VSCODE_EXTENSION_DIR=core.vscode.extension.mflow
BUILD_TREK="0"
BUILD_EXT="0"
BUILD_BLCKS="0"

pwd

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
if [ "$BUILD_TREK" = "1" ]; then
    echo "git clone trek repo"
    cd submodule
    git submodule update --init --remote $TREK_DIR
    echo "build document of trek"
    cd $TREK_DIR
    pip install -r requirements-docs.txt
    cd docs
    rm -rf ./reference/commands/*
    make clean
    make html
    cd ../../../
    rm -rf ./source/reference/cli/*
    cp -r submodule/$TREK_DIR/docs/reference/commands ./source/reference/cli/
    cp submodule/$TREK_DIR/CHANGELOG.md ./source/reference/cli/CHANGELOG.md
fi


# copy references from blcks sdk repo
if [ "$BUILD_BLCKS" = "1" ]; then
    echo "git clone blcks sdk repo"
    cd submodule
    git submodule update --init --remote $BLKCS_SDK_DIR
    echo "build document of blcks sdk"
    cd $BLKCS_SDK_DIR
    pip install -r requirements-docs.txt
    python setup.py build
    python setup.py install
    cd docs
    rm -rf ./reference/commands/*
    make clean
    make html
    cd ../../../
    rm -rf ./source/reference/blcks/*
    # cp -r ../$BLKCS_SDK_DIR/docs/reference/clients ./source/reference/blcks
    cp -r submodule/$BLKCS_SDK_DIR/docs/_static/images ./source/_static/
    cp -r submodule/$BLKCS_SDK_DIR/docs/reference/services ./source/reference/blcks
    cp submodule/$BLKCS_SDK_DIR/docs/guide/installation.rst ./source/reference/blcks/installation.rst
    cp submodule/$BLKCS_SDK_DIR/docs/guide/configuration.rst ./source/reference/blcks/configuration.rst
    cp submodule/$BLKCS_SDK_DIR/docs/guide/quickstart.rst ./source/reference/blcks/quickstart.rst
fi

# copy references from trek vscode extension repo
if [ "$BUILD_EXT" = "1" ]; then
    echo "git clone vscode extension repo"
    br=$(git config -f .gitmodules --get submodule.submodule/$VSCODE_EXTENSION_DIR.branch)
    cd submodule/$VSCODE_EXTENSION_DIR
    git reset --hard HEAD
    echo "git checkout branch $br"
    git checkout -b $br
    git config pull.rebase true
    git pull --ff-only
    echo "git pull branch $br"
    git pull origin $br
    echo "build document of trek vscode extension"
    pip install -r requirements-docs.txt
    cd docs
    rm -rf ./reference/commands/*
    make clean
    make html
    cd ../../../
    rm -rf ./source/reference/extension/*
    cp -r submodule/$VSCODE_EXTENSION_DIR/docs/reference/commands source/reference/extension/commands/
    cp submodule/$VSCODE_EXTENSION_DIR/CHANGELOG.md source/reference/extension/CHANGELOG.md
fi

make html

# .nojekyll
touch ./build/html/.nojekyll
