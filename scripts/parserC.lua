local parserC = {
    instruction = ""
}

function parserC:dest()
    return string.match(self.instruction, "(%S+)=") or ""
end

function parserC:comp()
    return string.match(self.instruction, "=(%S+)") or string.match(self.instruction, "(%S+);")
end

function parserC:jump()
    return string.match(self.instruction, ";(%S+)") or ""
end

return parserC
