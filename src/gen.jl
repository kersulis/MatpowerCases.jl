type Gen
    "bus number"
    GEN_BUS::Vector{Int64}
    "Pg, real power output (MW)"
    PG::Vector{Float64}
    "Qg, reactive power output (MVAr)"
    QG::Vector{Float64}
    "Qmax, maximum reactive power output at Pmin (MVAr)"
    QMAX::Vector{Float64}
    "Qmin, minimum reactive power output at Pmin (MVAr)"
    QMIN::Vector{Float64}
    "Vg, voltage magnitude setpoint (p.u.)"
    VG::Vector{Float64}
    "mBase, total MVA base of this machine, defaults to baseMVA"
    MBASE::Vector{Float64}
    "status, 1 - machine in service, 0 - machine out of service"
    GEN_STATUS::Vector{Bool}
    "Pmax, maximum real power output (MW)"
    PMAX::Vector{Float64}
    "Pmin, minimum real power output (MW)"
    PMIN::Vector{Float64}
    "Pc1, lower real power output of PQ capability curve (MW)"
    PC1::Vector{Float64}
    "Pc2, upper real power output of PQ capability curve (MW)"
    PC2::Vector{Float64}
    "Qc1min, minimum reactive power output at Pc1 (MVAr)"
    QC1MIN::Vector{Float64}
    "Qc1max, maximum reactive power output at Pc1 (MVAr)"
    QC1MAX::Vector{Float64}
    "Qc2min, minimum reactive power output at Pc2 (MVAr)"
    QC2MIN::Vector{Float64}
    "Qc2max, maximum reactive power output at Pc2 (MVAr)"
    QC2MAX::Vector{Float64}
    "ramp rate for load following/AGC (MW/min)"
    RAMP_AGC::Vector{Float64}
    "ramp rate for 10 minute reserves (MW)"
    RAMP_10::Vector{Float64}
    "ramp rate for 30 minute reserves (MW)"
    RAMP_30::Vector{Float64}
    "ramp rate for reactive power (2 sec timescale) (MVAr/min)"
    RAMP_Q::Vector{Float64}
    "area participation factor"
    APF::Vector{Float64}
    "Kuhn-Tucker multiplier on upper Pg limit (u/MW)"
    MU_PMAX::Vector{Float64}
    "Kuhn-Tucker multiplier on lower Pg limit (u/MW)"
    MU_PMIN::Vector{Float64}
    "Kuhn-Tucker multiplier on upper Qg limit (u/MVAr)"
    MU_QMAX::Vector{Float64}
    "Kuhn-Tucker multiplier on lower Qg limit (u/MVAr)"
    MU_QMIN::Vector{Float64}
end

"""
Extract gen information from mpc Dict. Return instance of Gen.

IN:

* mpc. Instance of MPC dict (loaded, for instance, by loadcase())

OUT:

* Instance of Gen containing all gen data.
"""
function extract_gen(mpc)
    gen = mpc["gen"]
    if size(gen, 2) == 21
        blanks = ([NaN], [NaN], [NaN], [NaN])
        return Gen([gen[:, i] for i in 1:size(gen, 2)]..., blanks...)
    elseif size(gen, 2) == 25
        return Gen([gen[:, i] for i in 1:size(gen, 2)]...)
    elseif size(gen, 2) == 10 # version 1 data
        blanks = ([NaN], [NaN], [NaN], [NaN],
                    [NaN], [NaN], [NaN], [NaN],
                    [NaN], [NaN], [NaN], [NaN],
                    [NaN], [NaN], [NaN])
        return Gen([gen[:, i] for i in 1:size(gen, 2)]..., blanks...)
    end
end

"""
Shortcut for returning gen info for one of the cases listed by
`casenames()`.
"""
function extract_gen(cname::AbstractString)
    mpc = loadcase(cname; describe=false)
    extract_gen(mpc)
end
