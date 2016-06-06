type Case
    baseMVA::Float64
    gen::Gen
    branch::Branch
    docstring::AbstractString
    bus::Bus
    version::Int64
    gencost::Union{Gencost, Void}
    areas
    bus_name::Vector{AbstractString}
end

"""
Extract case information from mpc Dict. Return instance of Case.

IN:

* mpc. Instance of MPC dict (loaded, for instance, by loadcase())

OUT:

* Instance of Case containing all case data.
"""
function extract_case(mpc)
    if in("baseMVA", keys(mpc))
        baseMVA = mpc["baseMVA"]
    else
        info("No base MVA found. Guessing 100.0.")
        baseMVA = 100.0
    end
    gen = extract_gen(mpc)
    branch = extract_branch(mpc)
    docstring = mpc["docstring"]
    bus = extract_bus(mpc)
    version = in("version", keys(mpc)) ? parse(mpc["version"]) : 1
    gencost = in("gencost", keys(mpc)) ? extract_gencost(mpc) : nothing
    areas = in("areas", keys(mpc)) ? mpc["areas"] : nothing
    bus_name = in("bus_name", keys(mpc)) ? mpc["bus_name"][:] : AbstractString[]

    Case(baseMVA, gen, branch, docstring, bus, version, gencost, areas, bus_name)
end

"""
Shortcut for returning case info for one of the cases listed by
`casenames()`.
"""
function extract_case(cname::AbstractString)
    mpc = loadcase(cname; describe=false)
    extract_case(mpc)
end
