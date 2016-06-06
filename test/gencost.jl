using MatpowerCases, Base.Test

println("- extract_gencost check")
for c in casenames()
    if c != "case4gs" # case4gs has no gencost data
        mpc = loadcase(c; describe=false)
        @assert isa(extract_gencost(mpc), MatpowerCases.Gencost)
        @assert isa(extract_gencost(c), MatpowerCases.Gencost)
    end
end

