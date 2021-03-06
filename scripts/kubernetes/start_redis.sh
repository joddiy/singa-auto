#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

source ./scripts/kubernetes/utils.sh

title "Starting SINGA-Auto's Redis..."

LOG_FILE_PATH=$PWD/logs/start_redis_service.log
(kubectl create -f scripts/kubernetes/start_redis_service.json \
&> $LOG_FILE_PATH) &
ensure_stable "SINGA-Auto's Redis Service" $LOG_FILE_PATH 2

LOG_FILE_PATH=$PWD/logs/start_redis_deployment.log
(kubectl create -f scripts/kubernetes/start_redis_deployment.json \
&> $LOG_FILE_PATH) &
ensure_stable "SINGA-Auto's Redis Deployment" $LOG_FILE_PATH 2
