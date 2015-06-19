module MatpowerCases
using MAT

export loadcase

function loadcase(caseName::ASCIIString)
    """
    Return a Dict containing power system data 
    in MATPOWER's format. Valid cases:
    case118
    case118
    case14
    case14
    case24_ieee_rts
    case300
    case30pwl
    case30
    case30Q
    case391
    case4gs
    case57
    case6ww
    case9
    case9
    case9Q
    case79
    case96
    Return this list of cases by running casenames().
    """
    matread("$(dirname(@__FILE__))/$(caseName).mat")["networkData"]
end

function casenames()
    """ Return an array containing all valid
    MatpowerCases case names.
    """
    return [
    "case118",
    "case14",
    "case2383wp",
    "case24_ieee_rts",
    "case2736sp",
    "case2737sop",
    "case2746wop",
    "case2746wp",
    "case300",
    "case3012wp",
    "case30",
    "case30pwl",
    "case30Q",
    "case3120sp",
    "case3375wp",
    "case39",
    "case4gs",
    "case57",
    "case6ww",
    "case9",
    "case9Q",
    "case79",
    "case96"
    ]
end

end