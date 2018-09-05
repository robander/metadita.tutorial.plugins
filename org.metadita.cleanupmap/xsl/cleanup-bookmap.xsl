<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="*[contains(@class,' bookmap/part ')]/
        *[contains(@class,' map/topicref ') and not(contains(@class,' bookmap/chapter '))][empty(@format) or @format='dita'][@href or @navtitle or */*[contains(@class,' topic/navtitle ')]]/
        @class">
        <xsl:attribute name="class">- map/topicref bookmap/chapter </xsl:attribute>
        <xsl:attribute name="originalclass"><xsl:value-of select="."/></xsl:attribute>
    </xsl:template>
    
</xsl:stylesheet>