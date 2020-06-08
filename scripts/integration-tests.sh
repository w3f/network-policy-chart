#!/bin/bash

source /scripts/common.sh
source /scripts/bootstrap-helm.sh


run_tests() {
    echo Running tests...

}

teardown() {
    helm del network-policy
}

main(){
    #if [ -z "$KEEP_W3F_NETWORK_POLICY" ]; then
    #    trap teardown EXIT
    #fi

    helm install ./charts/network-policy

    run_tests
}

main
