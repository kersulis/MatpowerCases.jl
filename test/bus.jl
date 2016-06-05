using MatpowerCases, Base.Test

println("- extract_bus check")
for c in casenames()
    mpc = loadcase(c; describe=false)
    @assert isa(extract_bus(mpc), MatpowerCases.Bus)
    @assert isa(extract_bus(c), MatpowerCases.Bus)
end
