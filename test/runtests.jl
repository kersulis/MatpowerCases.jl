using Base.Test
using MatpowerCases

println("Running tests...")

networkData = loadcase("case9")

gencost = [2.0  1500.0  0.0  3.0  0.11    5.0  150.0
		 2.0  2000.0  0.0  3.0  0.085   1.2  600.0
		 2.0  3000.0  0.0  3.0  0.1225  1.0  335.0]

@test networkData["gencost"] == gencost