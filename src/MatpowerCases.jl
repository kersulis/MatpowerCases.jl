module MatpowerCases
using MAT

export loadcase,casenames

"""
Return a Dict containing power system data
in MATPOWER's format.
Return this list of cases by running casenames().
"""
function loadcase(caseName::ASCIIString)
    s = joinpath(Pkg.dir(),"MatpowerCases","data")
    mpc = matread(joinpath(s,"$(caseName).mat"))["mpc"]
    ds = mpc["docstring"]
    println(split(ds,"\n")[1])
    return mpc
end

function casenames()
    """ Return an array containing all valid
    MatpowerCases case names.
    """
    s = joinpath(Pkg.dir(),"MatpowerCases","data")
    names = readdir(s)
    [splitext(name)[1] for name in names]
end

end
