local parserA = {
    instruction = ""
}

function parserA:dest()
    if not self.instruction or self.instruction == "" then
        return
    end

    local tmpstr = self.instruction
    local label = string.match(self.instruction, "@(%S+)")
    if label then
        if AssemblerTable[label] then
            tmpstr = string.gsub(self.instruction, "@(%S+)", AssemblerTable[label])
        else
            if not string.match(self.instruction, "@(%d+)") then
                AssemblerTable[label] = tostring(AssemblerTable._count)
                AssemblerTable._count = AssemblerTable._count + 1
                tmpstr = string.gsub(self.instruction, "@(%S+)", AssemblerTable[label])
            end 
        end
    end

    for destNum in string.gmatch(tmpstr, "%d+") do
        return destNum
    end
end

return parserA