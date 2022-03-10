#!/bin/bash

for seq in batch?/*seq
do
  echo "$seq"
  sed -i 's/^>[a-zA-Z0-9.]\+\s\+/>/; s/\.[0-9]\s.*//' "$seq"
done

for pep in batch?/*pep
do
  echo "$pep"
  sed -i 's/\.[0-9]\s.*//' "$pep"
done
