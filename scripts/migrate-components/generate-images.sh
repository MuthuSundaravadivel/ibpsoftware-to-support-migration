#!/bin/bash

#
# Copyright contributors to the Migration
#
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at:
#
# 	  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# 

LOGGING_COMPONENT=$1
FILE_PATH=$2

BASEDIR=$(cd "$(dirname "$0")/.."; pwd)
current_script=`basename "$0"`

. ${BASEDIR}/env.sh
${BASEDIR}/common/sanitize_env.sh
if [ "$?" != "0" ]; then
    exit 1
fi

# import logging functions
. ${BASEDIR}/common/logger.sh

debug "Generate console images."

cat << EOF > ${FILE_PATH}
{
    "configtxlatorImage": "ibm-hlfsupport-utilities",
    "configtxlatorTag": "${PEER_FABRIC_VERSION}-${IMAGE_DATE}",
    "consoleImage": "ibm-hlfsupport-console",
    "consoleInitImage": "ibm-hlfsupport-init",
    "consoleInitTag": "${RELEASE_VERSION}-${IMAGE_DATE}",
    "consoleTag": "${RELEASE_VERSION}-${IMAGE_DATE}",
    "couchdbImage": "ibm-hlfsupport-couchdb",
    "couchdbTag": "${COUCHDB_VERSION}-${IMAGE_DATE}",
    "deployerImage": "ibm-hlfsupport-deployer",
    "deployerTag": "${RELEASE_VERSION}-${IMAGE_DATE}",
    "mustgatherImage": "ibm-hlfsupport-mustgather",
    "mustgatherTag": "${RELEASE_VERSION}-${IMAGE_DATE}"
}
EOF

debug "Successfully generated console images."