package.path = package.path .. ";./scripts/?.lua"

require("constable")
local parserA = require("parserA")
local codeA = require("codeA")
local parserC = require("parserC")
local codeC = require("codeC")


local function checkInstruction(line)
    local isAinstruction = string.match(line, "%S+") and string.match(string.match(line, "%S+"), "@")
    if isAinstruction then
        return "A"
    end

    return "C"
end


--===================================
-- Main Loop
--===================================

print("Enter ASM File Name :")
local asmFile = io.read()
if not asmFile or asmFile == "" then
    print("Enter Params Error!!!")
    return
end

local realFile = "./output/" .. asmFile .. ".asm"
io.output("./output/" .. asmFile .. ".hack")

local lineCount = -1
for line in io.lines(realFile) do

    repeat
        if string.match(line, "%S+") and string.match(string.match(line, "%S+"), "//") then
            break
        end

        if not string.match(line, "%S") then
            break
        end

        local isFind = false
        local label = string.match(line, "%((%S+)%)")
        if label then
            isFind = true
            AssemblerTable[label] = tostring(lineCount + 1)
        end

        if not isFind then
            lineCount = lineCount + 1
        end
    until true

end


for line in io.lines(realFile) do

    repeat
        if string.match(line, "%S+") and string.match(string.match(line, "%S+"), "//") then
            break
        end

        if not string.match(line, "%S") then
            break
        end

        if string.match(line, "%S+") and string.match(string.match(line, "%S+"), "%(") then
            break
        end

        local insType = checkInstruction(line)
        if insType == "A" then
            parserA.instruction = line
            local astring = parserA:dest()
            local acode = codeA:dest(astring)
            io.write(acode)
            io.write("\n")
        elseif insType == "C" then
            parserC.instruction = line
            local d = parserC:dest()
            local c = parserC:comp()
            local j = parserC:jump()

            local bd = codeC:dest(d)
            local bc = codeC:comp(c)
            local bj = codeC:jump(j)

            local result = "111" .. bc .. bd .. bj
            io.write(result)
            io.write("\n")
        end
    until true
    
end

io.read()