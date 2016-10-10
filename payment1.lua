local client = require("soap.client")
client.https = require("ssl.https")

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

local ns, meth, ent = client.call {
  url = "https://api.authorize.net/soap/v1/Service.asmx",
  method = "CreateCustomerProfile",
  soapaction = "https://api.authorize.net/soap/v1/CreateCustomerProfile",
  entries = {
    {tag="merchantAuthentication",
      {tag="name", "7rV29R9y8Prc", },
      {tag="transactionKey", "7Z3NfE4x24j33P27", },
    },
    {tag="profile",
      {tag="email", "asdas@asd.com"},
      {tag="description", "asm"},
      {tag="merchantCustomerId", "123"},
    },
    {tag="validationMode", "liveMode"},
  }
}

print("namespace = ", ns, "element name = ", meth)
tprint(ent, 0)
