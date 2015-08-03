# MATPOWER transmission network data

[![MatpowerCases](http://pkg.julialang.org/badges/MatpowerCases_0.3.svg)](http://pkg.julialang.org/?pkg=MatpowerCases&ver=release)
[![MatpowerCases](http://pkg.julialang.org/badges/MatpowerCases_0.4.svg)](http://pkg.julialang.org/?pkg=MatpowerCases&ver=nightly)
[![Build Status](https://travis-ci.org/kersulis/MatpowerCases.jl.svg)](https://travis-ci.org/kersulis/MatpowerCases.jl)
[![Coverage Status](https://coveralls.io/repos/kersulis/MatpowerCases.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/kersulis/MatpowerCases.jl?branch=master)

My favorite [MATPOWER][1] function is `loadcase(caseName)`, so I made it work in Julia.

This package contains all transmission network data included in MATPOWER 5.1, plus data for the [RTS-96 and RTS-79 networks][4]. You can return a `Dict` containing network data using `loadcase(caseName)`, just as you would with MATPOWER. No MATLAB kernel or MATPOWER installation is required.

## Installation and use

To install:

```julia
Pkg.add("MatpowerCases")
```
To load data for, say, the [IEEE 118-bus power flow test case][7]:

```julia
using MatpowerCases
mpc = loadcase("case118")
```
You should see a one-line description of the network (unless you passed `describe=false` to `loadcase()`). Now `mpc` is a Dict containing network data in [MATPOWER caseformat][2]:

```julia
 CASE118    Power flow data for IEEE 118 bus test case.

Dict{ASCIIString,Any} with 8 entries:
  "baseMVA"   => 100.0
  "gen"       => [1.0 0.0 0.0 15.0 -5.0 0.955 100.0 1.0 100.0 0.0 0.0 0.0 0.0 0…
  "branch"    => [1.0 2.0 0.0303 0.0999 0.0254 0.0 0.0 0.0 0.0 0.0 1.0 -360.0 3…
  "docstring" => " CASE118    Power flow data for IEEE 118 bus test case.    …
  "bus_name"  => Any["Riversde  V2"…
  "bus"       => [1.0 2.0 51.0 27.0 0.0 0.0 1.0 0.955 10.67 138.0 1.0 1.06 0.94…
  "version"   => "2"
  "gencost"   => [2.0 0.0 0.0 3.0 0.01 40.0 0.0…
```

 You may load data for any network MATPOWER 5.1 supports, plus the RTS-96 (`case96`) and RTS-79 (`case79`) networks.

## Detailed network information

The one-line description you see when you load a network is the first line of a docstring. Print the whole thing to see detailed network information:

```julia
print(mpc["docstring"])
```

This is the same docstring you would see if you ran `help(caseName)` in a MATLAB environment with MATPOWER installed.

## Who to credit when publishing

MATPOWER is an awesome tool for power and energy researchers. It is actively developed by Ray Zimmerman, Carlos Murillo-Sánchez and others. If you use this package in your research, please cite them:

*R. D. Zimmerman, C. E. Murillo-Sánchez, and R. J. Thomas, "MATPOWER: Steady-State Operations, Planning and Analysis Tools for Power Systems Research and Education," Power Systems, IEEE Transactions on, vol. 26, no. 1, pp. 12-19, Feb. 2011.*

Also, if you use any of the four recently-added European grid test networks (`caseName` ending in "pegase"), please cite [this paper][9] as follows:

*Fliscounakis, S.; Panciatici, P.; Capitanescu, F.; Wehenkel, L., "Contingency Ranking With Respect to Overloads in Very Large Power Systems Taking Into Account Uncertainty, Preventive, and Corrective Actions," Power Systems, IEEE Transactions on , vol.28, no.4, pp.4909,4917, Nov. 2013
doi: 10.1109/TPWRS.2013.2251015*

**Note:** The popular [RTS-79 and RTS-96 networks][4] are not included in MATPOWER, but are available in MatpowerCases thanks to Zhu Wang and Robert Green, who made their .m files freely available.


[1]: http://www.pserc.cornell.edu//matpower/
[2]: http://www.maths.ed.ac.uk/optenergy/LocalOpt/caseformat.txt
[4]: https://www.ee.washington.edu/research/pstca/rts/pg_tcarts.htm
[5]: http://www.parallelcoding.com/wp-content/uploads/Research/MCSPruning
[6]: https://www.mail-archive.com/matpower-l@cornell.edu/msg01308.html
[7]: https://www.ee.washington.edu/research/pstca/pf118/pg_tca118bus.htm
[8]: http://www.pserc.cornell.edu//matpower/docs/ref/
[9]: http://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=6488772&isnumber=6627990
