#!/usr/bin/env bash

# Copyright (c) 2017-present SIGHUP s.r.l All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

LOCAL_KUMACTL=$PWD/kumactl

function kumactl () {
  $LOCAL_KUMACTL "$@"
}

cd ../../katalog/kong-mesh

cd standalone

echo "Upgrade standalone manifests"

cat > resources/kong-mesh-standalone.yml <<- EOM
# Copyright (c) 2017-present SIGHUP s.r.l All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.
EOM

kumactl install control-plane \
  --without-kubernetes-connection \
  --mode=standalone >> resources/kong-mesh-standalone.yml

cd ../multi-cluster

cd global-control-plane

echo "Upgrade multi-cluster global-control-plane manifests"

cat > resources/kong-mesh-global.yml <<- EOM
# Copyright (c) 2017-present SIGHUP s.r.l All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.
EOM

kumactl install control-plane \
  --without-kubernetes-connection \
  --mode=global \
  --tls-kds-global-server-secret=kds-server-tls >> resources/kong-mesh-global.yml

cd ../

cd zone-control-plane

echo "Upgrade multi-cluster zone-control-plane manifests"

cat > resources/kong-mesh-zone.yml <<- EOM
# Copyright (c) 2017-present SIGHUP s.r.l All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.
EOM

kumactl install control-plane \
  --without-kubernetes-connection \
  --mode=zone \
  --zone=zone1 \
  --ingress-enabled \
  --kds-global-address=grpcs://localhost:1234 >> resources/kong-mesh-zone.yml

cd ../../../../tools/kong-mesh
