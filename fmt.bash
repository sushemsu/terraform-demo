#!/usr/bin/env bash
find . -type f -name "*.tf" -exec terraform fmt {} \;
