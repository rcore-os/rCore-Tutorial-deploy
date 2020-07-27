#!/bin/sh
# 下面的 DEPLOY_DIR 目录需要关联到 https://github.com/rcore-os/rCore-Tutorial-deploy 远程仓库
# 随后可以通过 https://rcore-os.github.io/rCore-Tutorial-deploy 来访问
DEPLOY_DIR=../rCore-Tutorial-deploy/
CURRENT_DIR=$(pwd)
DEPLOY_DIR=$CURRENT_DIR/$DEPLOY_DIR

# Reset to master
cd $DEPLOY_DIR
git fetch origin
git reset --hard origin/master

# Build and copy
cd $CURRENT_DIR
gitbook build
cp -r _book/* $DEPLOY_DIR
cd $DEPLOY_DIR

# Commit and push
CURRENT_TIME=$(date +"%Y-%m-%d %H:%m:%S")
git add *
git commit -m "[Auto-deploy] Build $CURRENT_TIME"
git push origin master

cd $CURRENT_DIR