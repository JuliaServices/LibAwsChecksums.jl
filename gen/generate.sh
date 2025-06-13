#!/bin/bash
dir=$(dirname "$0")
julia -g -O0 --project="$dir" -e 'using Pkg; Pkg.instantiate()'
julia -g -O0 --project="$dir" -t auto "$dir/generator.jl"
