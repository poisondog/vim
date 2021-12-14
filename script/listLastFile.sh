#!/bin/bash
find . -printf "%T@ %Tc %p\n" | sort -r -n | head -20
