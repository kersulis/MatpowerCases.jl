using MatpowerCases, Base.Test

println("- extract_case check")
for c in casenames()
    mpc = loadcase(c; describe=false)
    @assert isa(extract_case(mpc), MatpowerCases.Case)
    @assert isa(extract_case(c), MatpowerCases.Case)
end

c = joinpath(Pkg.dir(),"MatpowerCases","data","case118.mat")
loadcase(c; describe=false)
@assert isa(extract_case(c), MatpowerCases.Case)
