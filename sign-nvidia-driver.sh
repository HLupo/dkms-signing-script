#!/bin/bash
# sign-nvidia-driver.sh

hash_algo=sha256
private_key=/root/nvidia-driver.key
x509_cert=/root/nvidia-driver.der

prefix=/usr/src/kernels/
# For Debian/Ubuntu, use
#prefix=/usr/src/linux-headers-

"${prefix}${1}/scripts/sign-file" \
    "${hash_algo}" "${private_key}" "${x509_cert}" "${2}" \
    && echo "Signed newly-built module ${2} with MOK successfully." >&2 \
    && exit 0
echo "Error signing file ${2}." >&2
exit 1