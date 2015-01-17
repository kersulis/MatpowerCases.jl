# Bringing MATPOWER's transmission network data to Julia

[MATPOWER][1] provides several MATLAB power flow functions, but it also includes data for many transmission networks. These networks are frequently used by power and energy researchers to validate new analysis methods. MatpowerCases.jl makes it easy to load any of MATPOWER's transmission network data into your Julia environment.

# Instructions for installation and use

`MatpowerCases` is currently an [unregistered Julia package][3]. To install it, use:

```julia
Pkg.clone("https://github.com/kersulis/MatpowerCases.jl.git")
```
Now that you have the package installed, you may load data for a transmission network:

```julia
using MatpowerCases
networkData = loadcase("case118")
```
Now `networkData` is a Dict containing IEEE 118-bus network data in the format described [here][2]. You may load data for any network MATPOWER supports:

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
```

The popular [RTS-96 network][4] is not included in MATPOWER, but is available in MatpowerCases.jl thanks to [this freely available file][5] (which I found [here][6]. Load RTS-96 data using:

```julia
networkData = loadcase("case96")
```

[1]: http://www.pserc.cornell.edu//matpower/
[2]: http://www.maths.ed.ac.uk/optenergy/LocalOpt/caseformat.txt
[3]: http://julia.readthedocs.org/en/latest/manual/packages/#installing-unregistered-packages
[4]: https://www.ee.washington.edu/research/pstca/rts/pg_tcarts.htm
[5]: http://www.parallelcoding.com/wp-content/uploads/Research/MCSPruning/case96.m
[6]: https://www.mail-archive.com/matpower-l@cornell.edu/msg01308.html