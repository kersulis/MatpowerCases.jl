using MatpowerCases, Base.Test

for c in casenames()
    mpc = loadcase(c; describe=false)
    @assert isa(extract_gen(mpc), MatpowerCases.Gen)
end
