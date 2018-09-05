<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    
    <xsl:import href="plugin:org.dita.base:xsl/common/dita-utilities.xsl"/>
    <xsl:import href="plugin:org.dita.base:xsl/common/output-message.xsl"/>
    
    <xsl:import href="cleanupmapImpl.xsl"/>
    <xsl:import href="cleanup-bookmap.xsl"/>
    
    
    <xsl:variable xmlns:dita="http://dita-ot.sourceforge.net" name="msgprefix">DOTX</xsl:variable>
    
    <xsl:output method="xml" encoding="utf-8" indent="no"/>

</xsl:stylesheet>