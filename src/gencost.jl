type Gencost
    "cost model, 1 = piecewise linear, 2 = polynomial "
    MODEL::Vector{Int64}
    "startup cost in US dollars"
    STARTUP::Vector{Float64}
    "shutdown cost in US dollars"
    SHUTDOWN::Vector{Float64}
    "number breakpoints in piecewise linear cost function, or number of coefficients in polynomial cost function"
    NCOST::Vector{Int64}
    "parameters defining total cost function begin in this col
        (MODEL = 1) : p0, f0, p1, f1, ..., pn, fn
             where p0 < p1 < ... < pn and the cost f(p) is defined
             by the coordinates (p0,f0), (p1,f1), ..., (pn,fn) of
             the end/break-points of the piecewise linear cost
        (MODEL = 2) : cn, ..., c1, c0
             n+1 coefficients of an n-th order polynomial cost fcn,
             starting with highest order, where cost is
             f(p) = cn*p^n + ... + c1*p + c0"
    COST::Vector{Vector{Float64}}
end

function extract_gencost(mpc)
    gencost = mpc["gencost"]
    ng = size(gencost, 1)
    coef = Vector{Vector{Float64}}([gencost[i,:][5:end] for i in 1:ng])
    return Gencost([gencost[:, i] for i in 1:4]..., coef)
end

"""
Shortcut for returning gencost info for one of the cases listed by
`casenames()`.
"""
function extract_gencost(cname::AbstractString)
    mpc = loadcase(cname; describe=false)
    extract_gencost(mpc)
end
