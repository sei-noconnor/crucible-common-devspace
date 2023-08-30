#!/bin/bash
dir=$1
kind_bin=$(which kind)
kubectl_bin=$(which kubectl)
envsubst < $dir/development/bootstrap-kind-config.yaml | $kind_bin create cluster --config - 


