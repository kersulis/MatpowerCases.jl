module MatpowerCases
using MAT

export loadcase,casenames

""" Return a Dict containing power system data
in MATPOWER's format.
Return this list of cases by running casenames().
"""
function loadcase(caseName::ASCIIString; describe=true)
    s = joinpath(Pkg.dir(),"MatpowerCases","data")
    p = joinpath(s,"$(caseName).mat")
    if !isfile(p)
        error("No data for network \"$(caseName)\".\nUse casenames() to list all valid names.")
    end
    mpc = matread(p)["mpc"]
    ds = mpc["docstring"]
    if describe
        println(split(ds,"\n")[1])
    end
    return mpc
end

""" Return an array containing all valid
MatpowerCases case names.
"""
function casenames()
    s = joinpath(Pkg.dir(),"MatpowerCases","data")
    names = readdir(s)
    [splitext(name)[1] for name in names]
end

end
