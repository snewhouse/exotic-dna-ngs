#!/usr/bin/env bash
CPUS=${1}
qrsh -q HighMemShortterm.q -pe smp ${CPUS}