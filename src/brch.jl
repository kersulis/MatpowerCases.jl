type Branch
    "f, from bus number"
    F_BUS::Vector{Int64}
    "t, to bus number"
    T_BUS::Vector{Int64}
    "r, resistance (p.u.)"
    BR_R::Vector{Float64}
    "x, reactance (p.u.)"
    BR_X::Vector{Float64}
    "b, total line charging susceptance (p.u.)"
    BR_B::Vector{Float64}
    "rateA, MVA rating A (long term rating)"
    RATE_A::Vector{Float64}
    "rateB, MVA rating B (short term rating)"
    RATE_B::Vector{Float64}
    "rateC, MVA rating C (emergency rating)"
    RATE_C::Vector{Float64}
    "ratio, transformer off nominal turns ratio"
    TAP::Vector{Float64}
    "angle, transformer phase shift angle (degrees)"
    SHIFT::Vector{Float64}
    "initial branch status, 1 - in service, 0 - out of service"
    BR_STATUS::Vector{Bool}
    "minimum angle difference, angle(Vf) - angle(Vt) (degrees)"
    ANGMIN::Vector{Float64}
    "maximum angle difference, angle(Vf) - angle(Vt) (degrees)"
    ANGMAX::Vector{Float64}
    "real power injected at 'from' bus end (MW)       (not in PTI format)"
    PF::Vector{Float64}
    "reactive power injected at 'from' bus end (MVAr) (not in PTI format)"
    QF::Vector{Float64}
    "real power injected at 'to' bus end (MW)         (not in PTI format)"
    PT::Vector{Float64}
    "reactive power injected at 'to' bus end (MVAr)   (not in PTI format)"
    QT::Vector{Float64}
    "Kuhn-Tucker multiplier on MVA limit at 'from' bus (u/MVA)"
    MU_SF::Vector{Float64}
    "Kuhn-Tucker multiplier on MVA limit at 'to' bus (u/MVA)"
    MU_ST::Vector{Float64}
    "Kuhn-Tucker multiplier lower angle difference limit (u/degree)"
    MU_ANGMIN::Vector{Float64}
    "Kuhn-Tucker multiplier upper angle difference limit (u/degree)"
    MU_ANGMAX::Vector{Float64}
end

"""
Extract branch information from mpc Dict. Return instance of Branch.

IN:

* mpc. Instance of MPC dict (loaded, for instance, by loadcase())

OUT:

* Instance of Branch containing all branch data.
"""
function extract_branch(mpc)
    branch = mpc["branch"]
    if size(branch, 2) == 13
        blanks = ([NaN], [NaN], [NaN], [NaN],
                    [NaN], [NaN], [NaN], [NaN])
        return Branch([branch[:, i] for i in 1:size(branch, 2)]..., blanks...)
    elseif size(branch, 2) == 11 # version 1 data
        blanks = ([NaN], [NaN], [NaN], [NaN],
                    [NaN], [NaN], [NaN], [NaN],
                    [NaN], [NaN])
        return Branch([branch[:, i] for i in 1:size(branch, 2)]..., blanks...)
    else
        return Branch([branch[:, i] for i in 1:size(branch, 2)]...)
    end
end

"""
Shortcut for returning branch info for one of the cases listed by
`casenames()`.
"""
function extract_branch(cname::AbstractString)
    mpc = loadcase(cname; describe=false)
    extract_branch(mpc)
end
