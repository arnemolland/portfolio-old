#!/bin/bash

flutter clean
webdev build
cp now.json build/now.json
cd build
now
now alias