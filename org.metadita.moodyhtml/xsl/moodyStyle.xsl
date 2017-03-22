<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="2.0">
  
  <xsl:import href="plugin:org.dita.html5:xsl/dita2html5.xsl"/>
  
  <xsl:param name="args.moodyhtml.mood"/>
  
  <xsl:variable name="moodychar">
    <xsl:choose>
      <xsl:when test="$args.moodyhtml.mood='chipper'">&#x263a;</xsl:when>
      <xsl:when test="$args.moodyhtml.mood='meh'">&#x1f610;</xsl:when>
      <xsl:when test="$args.moodyhtml.mood='grumps'">&#x2639;</xsl:when>
      <xsl:when test="$args.moodyhtml.mood='stinky'">&#x1f4a9;</xsl:when>
      <xsl:when test="$args.moodyhtml.mood='cat'">&#x1f63a;</xsl:when>
      <xsl:otherwise><xsl:text>FAIL:</xsl:text><xsl:value-of select="$args.moodyhtml.mood"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  
  <xsl:template match="*[contains(@class,' topic/title ')]//text()">
    <xsl:message>HEY! <xsl:value-of select="$args.moodyhtml.mood"/></xsl:message>
    <xsl:value-of select="translate(.,' ',$moodychar)"/>
  </xsl:template>
  
</xsl:stylesheet>
