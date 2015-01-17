# `MatpowerCases.jl`: Bringing MATPOWER casefiles to Julia

[MATPOWER][1] provides several MATLAB power flow functions, but it also includes data for many transmission networks. These networks are frequently used by power and energy researchers to validate new analysis methods. This Julia package makes it easy to load network data packaged with MATPOWER into your Julia environment.

# Instructions for installation and use

`MatpowerCases` is currently an unregistered Julia package. To install it, use:

```julia
Pkg.clone("https://github.com/kersulis/MatpowerCases.jl.git")
```
Now that you have the package installed, you may load data for a transmission network:

```julia
using MatpowerCases
networkData = loadcase("case118")
```
Now `networkData` is a Dict containing IEEE 118-bus network data in the format described [here][2]. You may load data for any of the following networks:

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


[1]: http://www.pserc.cornell.edu//matpower/
[2]: http://www.maths.ed.ac.uk/optenergy/LocalOpt/caseformat.txt