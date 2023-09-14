#!/bin/bash

arch=$(lscpu | grep Architecture | awk '{print $2}')

case $arch in
    x86_64)
        # Code to execute when architecture is x86_64
        echo "x86_64 architecture detected"
        
        # Additional check for mips
        if lscpu | grep -q mips; then
            # Code to execute when mips is detected
            echo "mips architecture detected"
        fi

        # Additional check for arm
        if lscpu | grep -q arm; then
            # Code to execute when arm is detected
            echo "arm architecture detected"
        fi
        ;;
    *)
        # Code to execute for other architectures
        echo "Other architecture detected"
        ;;
esac

