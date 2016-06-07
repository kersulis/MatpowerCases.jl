# Test specific data for one network:
println("- number/case9 check")
mpc = loadcase("case9")
gencost = [2.0  1500.0  0.0  3.0  0.11    5.0  150.0
		 2.0  2000.0  0.0  3.0  0.085   1.2  600.0
		 2.0  3000.0  0.0  3.0  0.1225  1.0  335.0]
@test mpc["gencost"] == gencost

# Ensure these networks exist in the `data`:
println("- file check")
@test issubset(["case96","case1354pegase"], casenames())

# Ensure every network's mpc Dict contains these keys:
println("- key check")
key_list = ["gen";"branch" ;"docstring";"bus"]
key_test = Bool[]
for name in casenames()
    mpc = loadcase(name,describe=false)
    push!(key_test,key_list ⊆ [key for key in keys(mpc)])
end
@test all(key_test)

println("- graceful failure test")
@test_throws ErrorException loadcase("invalidcasename")

