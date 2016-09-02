using MatpowerCases, PowerModels, Base.Test

println("- extract_case check")
for c in casenames()
    mpc = loadcase(c; describe=false)
    @assert isa(extract_case(mpc), MatpowerCases.Case)
    @assert isa(extract_case(c), MatpowerCases.Case)
end

c = joinpath(Pkg.dir(),"MatpowerCases","data","case118.mat")
loadcase(c; describe=false)
@assert isa(extract_case(c), MatpowerCases.Case)

# test against PowerModels .m file parser
c = joinpath(Pkg.dir(), "PowerModels", "test", "data", "case14.m")
pm_gen = PowerModels.parse_matpower(c)["gen"]

sorted_gen_keys = [
"index"
"gen_bus"
"pg"
"qg"
"qmax"
"qmin"
"vg"
"mbase"
"gen_status"
"pmax"
"pmin"
"pc1"
"pc2"
"qc1min"
"qc1max"
"qc2min"
"qc2max"
"ramp_agc"
"ramp_10"
"ramp_30"
"ramp_q"
"apf"
]

pm_gen_matrix = zeros(length(pm_gen), 21)
for kidx in 2:length(sorted_gen_keys)
    k = sorted_gen_keys[kidx]
    for gidx in 1:length(pm_gen)
        g = pm_gen[gidx]
        pm_gen_matrix[gidx,kidx-1] = g[k]
    end
end
mpc_gen = loadcase("case14")["gen"]

@assert mpc_gen == pm_gen_matrix
