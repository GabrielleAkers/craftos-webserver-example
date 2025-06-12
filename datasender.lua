local random_string = function(len)
    math.randomseed(os.clock())
    local template = string.rep("x", len)
    return string.gsub(
        template,
        '[xy]',
        function (c)
            local v = (c == "x") and math.random(0, 0xf) or math.random(8, 0xb)
            return string.format("%x", v)
        end
    )
end

if #arg < 1 then
    return error("Pass an ip to post to")
end

while true do
    --- generate some fake data and send it to the echo server every 5 seconds
    local fake_data = random_string(8)
    local jsonified = textutils.serialiseJSON({data=fake_data})
    print("Sending: " .. jsonified)
    http.post(arg[1], jsonified, {["Content-Type"]="application/json"})
    sleep(5)
end