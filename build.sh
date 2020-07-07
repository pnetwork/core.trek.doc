#!/usr/bin/env bash
#!/bin/bash
DIR=core.trek.doc
TREK_DIR=core.tool.python.mflow
BLKCS_SDK_DIR=core.sdk.python.blcks
VSCODE_EXTENSION_DIR=core.vscode.extension.mflow
BUILD_TREK="0"
BUILD_EXT="0"
BUILD_BLCKS="0"
CRAWL_SCRIPT_WF="0"
GITHUB_TOKEN=""
REF_REPO_BR="master"

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
      echo "--no-script-wf            do not crawl script and workflow template from nexus server"
      echo "--token                   use github token to checkout reference repo (core.sdk.python.blcks, core.tool.python.mflow, core.vscode.extension.mflow)"
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
    --no-script-wf )
      CRAWL_SCRIPT_WF="1"  
      shift
      ;;
    --token )
      GITHUB_TOKEN="$2"
      if ! [ "$GITHUB_TOKEN" ]; then
        echo "Please input the github token for checkout private repo."
        exit 1
      fi
      shift
      ;;
    *)
      break
      ;;
  esac
done

make clean

clone_repo(){
    repo_name=$1
    br_name=$2
    rm -rf ${repo_name}
    echo "$repo_name"
    if [ "$GITHUB_TOKEN" ]; then
        git clone -b ${br_name} https://${GITHUB_TOKEN}@github.com/pnetwork/${repo_name}.git
    else
        git clone -b ${br_name} https://github.com/pnetwork/${repo_name}.git
    fi
}

# copy references from trek repo
if [ "$BUILD_TREK" == "1" ]; then
    echo "git clone trek repo"
    cd reference_repos
    clone_repo ${TREK_DIR} ${REF_REPO_BR}
    cd $TREK_DIR
    echo "build document of trek"
    pip install -r requirements-docs.txt
    cd docs
    rm -rf ./reference/commands/*
    make clean
    make html
    cd ../../../
    rm -rf ./source/reference/cli/*
    cp -r reference_repos/$TREK_DIR/docs/reference/commands ./source/reference/cli/
    cp reference_repos/$TREK_DIR/CHANGELOG.md ./source/reference/cli/CHANGELOG.md
fi


# copy references from blcks sdk repo
if [ "$BUILD_BLCKS" = "1" ]; then
    echo "git clone blcks sdk repo"
    cd reference_repos
    clone_repo ${BLKCS_SDK_DIR} ${REF_REPO_BR}
    cd $BLKCS_SDK_DIR
    echo "build document of blcks sdk"
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
    cp -r reference_repos/$BLKCS_SDK_DIR/docs/_static/images ./source/_static/
    cp -r reference_repos/$BLKCS_SDK_DIR/docs/reference/services ./source/reference/blcks
    cp reference_repos/$BLKCS_SDK_DIR/docs/guide/installation.rst ./source/reference/blcks/installation.rst
    cp reference_repos/$BLKCS_SDK_DIR/docs/guide/configuration.rst ./source/reference/blcks/configuration.rst
    cp reference_repos/$BLKCS_SDK_DIR/docs/guide/quickstart.rst ./source/reference/blcks/quickstart.rst
fi

# copy references from trek vscode extension repo
if [ "$BUILD_EXT" = "1" ]; then
    echo "git clone vscode extension repo"
    cd reference_repos
    clone_repo ${VSCODE_EXTENSION_DIR} ${REF_REPO_BR}
    cd $VSCODE_EXTENSION_DIR
    echo "build document of trek vscode extension"
    pip install -r requirements-docs.txt
    cd docs
    rm -rf ./reference/commands/*
    make clean
    make html
    cd ../../../
    rm -rf ./source/reference/extension/*
    cp -r reference_repos/$VSCODE_EXTENSION_DIR/docs/reference/commands ./source/reference/extension/commands
    cp reference_repos/$VSCODE_EXTENSION_DIR/CHANGELOG.md ./source/reference/extension/CHANGELOG.md
fi

# crawl script and workflow template on nexus server
if [ "$CRAWL_SCRIPT_WF" = "0" ]; then
    echo "crawl script and workflow template on nexus server"
    python3 source/crawler/script_wf_producer.py
fi

make html

# .nojekyll
touch ./build/html/.nojekyll
