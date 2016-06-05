using MatpowerCases, Base.Test

println("- extract_gen check")
for c in casenames()
    mpc = loadcase(c; describe=false)
    @assert isa(extract_gen(mpc), MatpowerCases.Gen)
    @assert isa(extract_gen(c), MatpowerCases.Gen)
end
