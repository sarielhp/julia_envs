#!/usr/bin/env julia
# Test script for testing mrun option in julia_envs

using Plots
using Cairo

function (@main)(args)
    println("Hello from test_script! Argument count: $(length(args))")
    println("Arguments: $(args)")
    return 0
end
