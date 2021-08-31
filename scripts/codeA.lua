local codeA = {}

function codeA:dest(src)

    local function _chartobinary(num)
        local tmp = num
        local tmp_str = ""
        for i = 1, 8 do
            tmp_str = tmp_str .. tostring(tmp % 2)
            tmp = math.floor(tmp / 2)
        end
        return string.reverse(tmp_str)
    end

    local strCodeA = ""
    local machine = string.pack(">i2", tonumber(src))
    for i = 1, string.len(machine) do
        local str = string.sub(machine, i, i)
        strCodeA = strCodeA .. _chartobinary(string.byte(str))
    end

    return strCodeA
end

return codeA