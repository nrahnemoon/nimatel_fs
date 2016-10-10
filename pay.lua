require("socket")
local https = require("ssl.https")
ltn12 = require("ltn12")
require("LuaXML")

xmlstr = "<?xml version=\"1.0\" encoding=\"utf-8\"?>" ..
  "<createCustomerProfileRequest xmlns=\"AnetApi/xml/v1/schema/AnetApiSchema.xsd\">" ..
    "<merchantAuthentication>" ..
      "<name>7rV29R9y8Prc</name>" ..
      "<transactionKey>7Z3NfE4x24j33P27</transactionKey>" ..
    "</merchantAuthentication>" ..
    "<profile>" ..
      "<merchantCustomerId>112</merchantCustomerId>" ..
      "<description>Profile description here</description>" ..
      "<email>asdas@asdads.com</email>" ..
    "</profile>" ..
  "</createCustomerProfileRequest>";

source = ltn12.source.string(xmlstr);

response = {}
save = ltn12.sink.table(response)

xmlsize = # xmlstr

h = {["Content-Type"] = "text/xml", ["content-length"] = xmlsize }

ok, code, headers = https.request {url = "https://api.authorize.net/xml/v1/request.api", method = "POST", headers = h, source = source, sink = save}

print(code)
saveditem = response[1];
print(saveditem);
