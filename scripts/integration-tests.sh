#!/bin/bash

source /scripts/common.sh
source /scripts/bootstrap-helm.sh

NODES=5

run_tests() {
    echo Running tests...

    for i in $(seq 0 $(($NODES-1))); do
        kubectl get networkpolicies.networking.k8s.io pod-${i}
    done
}

teardown() {
    helm del network-policy
}

main(){
    if [ -z "$KEEP_W3F_NETWORK_POLICY" ]; then
        trap teardown EXIT
    fi

    helm install network-policy ./charts/network-policy --set size=$NODES

    run_tests
}

main
