#!/bin/bash

set -e

if [ -z "$ARCH" ]; then
    echo "ARCH not set"
    exit 1
fi


OUTPUTDIR="/src/bin/$ARCH"
mkdir -p /src/bin

#Is this a GIT repo? If so pass those to the build process.
if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
   GIT_HASH=$(git rev-parse HEAD)
   GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
   GIT_TIME=$(git show -s --date='unix' --format=%cd HEAD)
   GIT_TAG=$(git describe --tags 2>/dev/null | sed 's/-g.*//' || echo "NOTAG")
   echo "$GIT_TAG $GIT_BRANCH $GIT_HASH"
   
   dotnet publish $@ --configuration Release \
          -p:GitHash=$GIT_HASH \
          -p:GitBranch=$GIT_BRANCH \
          -p:GitDateTime=$GIT_TIME \
          -p:GitTag=$GIT_TAG \
          -p:PublishDir=$OUTPUTDIR \
          -r linux-$ARCH -p:PublishSingleFile=true --self-contained true   
   
else

   dotnet publish $@ --configuration Release \
          -p:PublishDir=$OUTPUTDIR \
          -r linux-$ARCH -p:PublishSingleFile=true --self-contained true

fi
