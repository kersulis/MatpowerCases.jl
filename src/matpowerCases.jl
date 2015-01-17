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
    case39
    case4gs
    case57
    case6ww
    case9
    case9
    case9Q
    """
    matread("$(dirname(@__FILE__))/$(caseName).mat")["networkData"]
end

end