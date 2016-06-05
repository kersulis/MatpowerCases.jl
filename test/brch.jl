using MatpowerCases, Base.Test

println("- extract_branch check")
for c in casenames()
    mpc = loadcase(c; describe=false)
    @assert isa(extract_branch(mpc), MatpowerCases.Branch)
    @assert isa(extract_branch(c), MatpowerCases.Branch)
end

