#!/bin/bash
unzip -o Realtek-RTL8821CU.zip
make -j $(nproc)
make install