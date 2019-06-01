#!/bin/bash

flutter clean
tuneup trim
webdev build
cp now.json build/now.json
cd build
now --target production