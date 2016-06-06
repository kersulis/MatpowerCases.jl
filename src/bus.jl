type Bus
    "bus number"
    BUS_I::Vector{Int64}
    "bus type"
    BUS_TYPE::Vector{Int64}
    "real power demand [MW]"
    PD::Vector{Float64}
    "reactive power demand [MVar]"
    QD::Vector{Float64}
    "shunt conductance [MW at V = 1 pu]"
    GS::Vector{Float64}
    "shunt susceptance [MVar at V = 1 pu]"
    BS::Vector{Float64}
    "area number"
    BUS_AREA::Vector{Int64}
    "voltage magnitude [pu]"
    VM::Vector{Float64}
    "voltage angle [deg]"
    VA::Vector{Float64}
    "base voltage [kV]"
    BASE_KV::Vector{Float64}
    "loss zone"
    ZONE::Vector{Int64}
    "maximum voltage magnitude [pu]"
    VMAX::Vector{Float64}
    "minimum voltage magnitude [pu]"
    VMIN::Vector{Float64}
    "Lagrange multiplier on real power mismatch (u/MW)"
    LAM_P::Vector{Float64}
    "Lagrange multiplier on reactive power mismatch (u/MVAr)"
    LAM_Q::Vector{Float64}
    "Kuhn-Tucker multiplier on upper voltage limit (u/p.u.)"
    MU_VMAX::Vector{Float64}
    "Kuhn-Tucker multiplier on lower voltage limit (u/p.u.)"
    MU_VMIN::Vector{Float64}
end

"""
Extract bus information from mpc Dict. Return instance of Bus.

IN:

* mpc. Instance of MPC dict (loaded, for instance, by loadcase())

OUT:

* Instance of Bus containing all bus data.
"""
function extract_bus(mpc)
    bus = mpc["bus"]
    if size(bus, 2) == 13
        blanks = ([NaN], [NaN], [NaN], [NaN])
        return Bus([bus[:, i] for i in 1:size(bus, 2)]..., blanks...)
    elseif size(bus, 2) == 17
        return Bus([bus[:, i] for i in 1:size(bus, 2)]...)
    else
        warn("bus matrix has improper number of columns")
        return NaN
    end
end

"""
Shortcut for returning bus info for one of the cases listed by
`casenames()`.
"""
function extract_bus(cname::AbstractString)
    mpc = loadcase(cname; describe=false)
    extract_bus(mpc)
end
