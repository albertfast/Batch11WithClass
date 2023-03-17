X        --->          Y
    SALESFORCE              EXTERNAL SYSTEM (AMZON)
INTEGRATION WHERE STARTING POINT IS SALESFORCE AND TARGET SYSTEM IS EXTERNAL/FOREIGN - THIS KIND OF INTEGRATION IS CALLED OUTBOUND INTEGRATION
        X       <---          Y
        SALESFORCE              EXTERNAL SYSTEM (AMZON)
INTEGRATION WHERE STARTING POINT IS EXTERNAL/FOREIGN AND TARGET SYSTEM IS SALESFORCE - THIS KIND OF INTEGRATION IS CALLED INBOUND INTEGRATION
OUTBOUND + INBOUND INTEGRATION => BI-DIRECTIONAL INTEGRATION

const { format } = require("path")
INTEGRATION
DATA/INFORMATION -> IS THE MAIN SOURCE OF COMMUNICATION
MESSAGE -> CHANNEL OF SYSTEM COMMUNICATION
AS PER WEB STANDARDS, THERE ARE 2 TYPE OF MESSAGE FORMAT
* JSON (JAVASCRIPT OBJECT NOTATITON)
* XML (EXTENSIBLE MARKUP LANGUAGE)
JSON
{
    "schoolname" : "Soft Innovas",
    "instructors" : 65,
    "IsitVirtual" : true,
    "courses" : [
        {
            "id" : 001,
            "name" : "Basic of Salesforce"
        },
        {
            "id" : 002,
            "name" : "Advance Salesforce Developer"
        },
        {
            "id" : 003,
            "name" : "Market Read Prep"
        }
    ]
}
Slack Messages are tansmitted in JSON format
{
    "to" : "userid/channelid",
    "currentdatetime" : "xxx/xx/xx xx:xx:xx",
    "message" : "Hello!"
}
Features of JSON:
* Easy to use
* Human-readable

Features of JSON:
* Easy to use
* Human-Readable
* Performace - JSON is very FontFaceSet
* All Modern Application follow JSON message format
XML
<?xml version="1.0" encoding="UTF-8"?>
<root>
    <schholname>Soft Innovas</schholname>
    <instructors>56</instructors>
    <isItVirtual type="boolean">true</isItVirtual>
    <courses>
        <course>
            <id>001</id>
            <name>Basic Training</name>
        </course>
        <course>
            <id>002</id>
            <name>Advnace Training</name>
        </course>
        <course>
            <id>002</id>
            <name>Super Advnace Training</name>
        </course>
    </courses>
</root>
Features of XML:
* Secure form of Communication