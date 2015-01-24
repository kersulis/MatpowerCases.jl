# Bringing MATPOWER's transmission network data to Julia

[MATPOWER][1] provides several MATLAB power flow functions, but it also includes data for many transmission networks. These networks are frequently used by power and energy researchers to validate new analysis methods. MatpowerCases makes it easy to load any of MATPOWER's transmission network data into your Julia environment.

# Instructions for installation and use

MatpowerCases is currently an [unregistered Julia package][3]. To install it, use:

```julia
Pkg.clone("https://github.com/kersulis/MatpowerCases.jl.git")
```
Now that you have the package installed, you may load data for a transmission network:

```julia
using MatpowerCases
networkData = loadcase("case118")
```
Now `networkData` is a Dict containing [IEEE 118-bus network][7] data in MATPOWER's [mpc format][2]. You may load data for any network MATPOWER supports, plus the RTS-96 (`case96`) and RTS-79 (`case79`) networks:

```bash
case118
case14
case2383wp
case24_ieee_rts
case2736sp
case2737sop
case2746wop
case2746wp
case300
case3012wp
case30
case30pwl
case30Q
case3120sp
case3375wp
case39
case4gs
case57
case6ww
case9
case9Q
case79
case96
```

The popular [RTS-79 and RTS-96 networks][4] are not included in MATPOWER, but are available in MatpowerCases thanks to Zhu Wang and Robert Green, who made their .m files [freely available][5]. You may load data for these networks using `loadcase("case96")` or `loadcase("case79")`.

[1]: http://www.pserc.cornell.edu//matpower/
[2]: http://www.maths.ed.ac.uk/optenergy/LocalOpt/caseformat.txt
[3]: http://julia.readthedocs.org/en/latest/manual/packages/#installing-unregistered-packages
[4]: https://www.ee.washington.edu/research/pstca/rts/pg_tcarts.htm
[5]: http://www.parallelcoding.com/wp-content/uploads/Research/MCSPruning
[6]: https://www.mail-archive.com/matpower-l@cornell.edu/msg01308.html
[7]: https://www.ee.washington.edu/research/pstca/pf118/pg_tca118bus.htm