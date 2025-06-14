require("lfs")
require("_util")

local data = dofile("_buildConfig.lua")

local outputDir = ...
outputDir = outputDir or "../"
local foFilename = "../computerfo.fo"

--Parameters
local params = {}
params["body.start.indent"] = "2pc"
params["page.margin.top"] = "0.25in"
params["page.margin.bottom"] = "0.25in"
params["page.margin.inner"] = "0.75in"
params["page.margin.outer"] = "0.75in"
params["paper.type"] = "A4"
params["body.start.indent"] = "0pt"
params["body.font.family"] = "'IBM Plex Serif'"
params["title.font.family"] = "'IBM Plex Sans'"
params["monospace.font.family"] = "'IBM Plex Mono'"
params["line-height"] = "1.30" -- Add this line to set 1.5x line spacing

--Auto-generate the main specialization file.
local filename = "fo.xsl"

local hFile = io.open(filename, "w")
hFile:write([[<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
]])

hFile:write([[    <xsl:import href="]], ToUnix(data.docbookXSLBasepath .. "fo/docbook.xsl"), '"/>\n')
hFile:write([[    <xsl:import href="fo-common.xsl"/>]], "\n")

WriteParamsToFile(hFile, dofile("_commonParams.lua"))
WriteParamsToFile(hFile, dofile("_commonFOParams.lua"))
WriteParamsToFile(hFile, params)

hFile:write([[</xsl:stylesheet>
]])

hFile:close()

--Create the command line.
local command = {}
command[#command + 1] = "java"
command[#command + 1] = "-cp"
command[#command + 1] = '"' .. table.concat({ data.saxonFilepath, data.xercesJars }, ":") .. '"'
command[#command + 1] = "-Djavax.xml.parsers.DocumentBuilderFactory=org.apache.xerces.jaxp.DocumentBuilderFactoryImpl"
command[#command + 1] = "-Djavax.xml.parsers.SAXParserFactory=org.apache.xerces.jaxp.SAXParserFactoryImpl"
command[#command + 1] =
	"-Dorg.apache.xerces.xni.parser.XMLParserConfiguration=org.apache.xerces.parsers.XIncludeParserConfiguration"
command[#command + 1] = "com.icl.saxon.StyleSheet"
command[#command + 1] = "-o"
command[#command + 1] = '"' .. foFilename .. '"'
command[#command + 1] = '"../Tutorials.xml"'
command[#command + 1] = filename

local finalCmd = table.concat(command, " ")
print(finalCmd)
print("")

os.execute(finalCmd)

command = {}
command[#command + 1] = data.fopBatch
command[#command + 1] = "-c"
command[#command + 1] = "fop.xconf"
command[#command + 1] = "-fo"
command[#command + 1] = '"' .. foFilename .. '"'
command[#command + 1] = "-pdf"
command[#command + 1] = '"' .. outputDir .. 'TutorialsComp.pdf"'

finalCmd = table.concat(command, " ")
print(finalCmd)
print("")

os.execute(finalCmd)
