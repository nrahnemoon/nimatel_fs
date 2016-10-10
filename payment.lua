require("socket")
local https = require("ssl.https")

function tprint (tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      print(formatting)
      tprint(v, indent+1)
    else
      print(formatting .. v)
    end
  end
end

local r, c, h = https.request("https://nimatel.com")


print(r);
print(c);
print(h);
