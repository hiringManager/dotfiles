#!/bin/bash
for f in *.png; do
  mv -n "$f" $RANDOM".png"
done
