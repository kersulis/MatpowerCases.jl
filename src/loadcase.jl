using MAT

"""
    mpc = loadcase(caseName)
    mpc = loadcase(fpath)

Return a Dict containing power system data in MATPOWER's format.
Argument may be any of the names returned by casenames(), or a
path to a .mat file containing MATPOWER-format data.

Set `describe` to `false` for silent operation.
"""
function loadcase(caseName::AbstractString; describe=true)
    if caseName[end-3:end] == ".mat"
        p = caseName
        !isfile(p) && error("File not found.")
    else
        s = joinpath(Pkg.dir(),"MatpowerCases","data")
        p = joinpath(s,"$(caseName).mat")
        !isfile(p) && error("No data for network \"$(caseName)\".\nUse casenames() to list all valid names.")
    end

    mpc = matread(p)["mpc"]
    ds = mpc["docstring"]
    if describe
        println(split(ds,"\n")[1])
    end
    return mpc
end

"""
    casenames()

Return an array containing all valid
MatpowerCases case names.
"""
function casenames()
    s = joinpath(Pkg.dir(),"MatpowerCases","data")
    names = readdir(s)
    [splitext(name)[1] for name in names]
end


