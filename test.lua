wrk.method = "GET";
wrk.body = "";

logfile = io.open("wrk.log", "w");

request = function()
ip = tostring(math.random(1, 255)).."."..tostring(math.random(1, 255)).."."..tostring(math.random(1, 255)).."."..tostring(math.random(1, 255))
path = "/?ip=" .. ip
return wrk.format(nil, path)
end

response = function(status,header,body)
logfile:write("\nbody:" .. body .. "\n-----------------");
end