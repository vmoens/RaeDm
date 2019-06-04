module RaeDm


isCuda = Ref(false)
CUDA(set=true) = (isCuda[] = set)
if isCuda[]
    print("Using CUDA\n")
    try
    	using CuArrays
    catch
 	@warn "failed to load cuda"
	isCuda[]=false
    end
end
using Flux, ForwardDiff, DiffResults, StatsFuns, NNlib, Statistics
using Flux.Tracker: TrackedReal, TrackedArray, track, @grad, data
using StatsFuns: softplus
import Flux: gpu, cpu

export FIVOChain, zero_grad!, gpu, cpu,optimize
include("miscelaneous.jl")

DEBUG = Ref(false)

include("ddm_distributions.jl")
include("types.jl")
include("truncgauss.jl")
include("ndt.jl")


include("model.jl")
include("optim.jl")
end # module
