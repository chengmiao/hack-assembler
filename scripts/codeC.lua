
local codeC = {}

function codeC:dest(str)
    local result = "000"
    if DestSybomlicToBinary[str] then
        return DestSybomlicToBinary[str]
    end

    return result
end

function codeC:comp(str)
    local result = "0000000"
    if CompSybomlicToBinary[str] then
        return CompSybomlicToBinary[str]
    end

    return result
end

function codeC:jump(str)
    local result = "000"
    if JumpSybomlicToBinary[str] then
        return JumpSybomlicToBinary[str]
    end

    return result
end

return codeC