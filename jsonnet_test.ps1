[Reflection.Assembly]::LoadFile("d:\program\json\Bin\Net40\Newtonsoft.Json.dll”)
$jsonString = '{
"jsonrpc": "2.0",
"method": "host.get",
"params": {"output": ["hostid","host"],
"selectInterfaces": ["interfaceid","ip"]},
"id": 2,
"auth": "0424bd59b807674191e7d77572075f33"
}'

# Parse Json string to JObject Json.net 
$config = [Newtonsoft.Json.Linq.JObject]::Parse($jsonString)



# Test Serialise/ Deserialise
$jsonString = '{
"jsonrpc": "2.0",
"method": "host.get",
"id": 2,
"auth": "0424bd59b807674191e7d77572075f33"
}'

# Add class for 
Add-Type @'
public class JsonTest{
	public string jsonrpc;
	public string method;
	public int id;
	public string auth;
}
'@

$oSerialise = New-Object JsonTest
$oSerialise.jsonrpc = "2.0"
$oSerialise.method = "host.get"
$oSerialise.id = 2
$oSerialise.auth = "0424bd59b807674191e7d77572075f33"

[Newtonsoft.Json.JsonConvert]::SerializeObject($oSerialise)

$oDeserialise = New-Object JsonTest

$oDeserialise = [Newtonsoft.Json.JsonConvert]::DeSerializeObject($jsonString)
