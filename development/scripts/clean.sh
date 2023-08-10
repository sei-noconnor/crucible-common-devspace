#!/bin/bash
echo "Clean Script"
dir=$1
kind_bin=$(which kind)
kubectl_bin=$(which kubectl)
$kind_bin delete cluster -n $(yq '.name' < $dir/development/bootstrap-kind-config.yaml)
# Cleanup Certs
# echo "Deleteing SSL Certificates"
# rm -rf $dir/development/ssl