<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

  <xsl:import href="plugin:org.dita.base:xsl/common/dita-utilities.xsl"/>
  <xsl:import href="plugin:org.dita.base:xsl/common/output-message.xsl"/>
  
  <xsl:variable name="msgprefix" select="'DOTX'"/>
  
  <xsl:character-map name="morse">
    <xsl:output-character character=" " string=" / "/>
    <xsl:output-character character="a" string=".- "/>
    <xsl:output-character character="b" string="-... "/>
    <xsl:output-character character="c" string="-... "/>
    <xsl:output-character character="d" string="-.. "/>
    <xsl:output-character character="e" string=". "/>
    <xsl:output-character character="f" string="..-. "/>
    <xsl:output-character character="g" string="--. "/>
    <xsl:output-character character="h" string=".... "/>
    <xsl:output-character character="i" string=".. "/>
    <xsl:output-character character="j" string=".--- "/>
    <xsl:output-character character="k" string="-.- "/>
    <xsl:output-character character="l" string=".-.. "/>
    <xsl:output-character character="m" string="-- "/>
    <xsl:output-character character="n" string="-. "/>
    <xsl:output-character character="o" string="--- "/>
    <xsl:output-character character="p" string=".--. "/>
    <xsl:output-character character="q" string="--.- "/>
    <xsl:output-character character="r" string=".-. "/>
    <xsl:output-character character="s" string="... "/>
    <xsl:output-character character="t" string="- "/>
    <xsl:output-character character="u" string="..- "/>
    <xsl:output-character character="v" string="...- "/>
    <xsl:output-character character="w" string=".-- "/>
    <xsl:output-character character="x" string="-..- "/>
    <xsl:output-character character="y" string="-.-- "/>
    <xsl:output-character character="z" string="--.. "/>
    <xsl:output-character character="1" string=".---- "/>
    <xsl:output-character character="2" string="..--- "/>
    <xsl:output-character character="3" string="...-- "/>
    <xsl:output-character character="4" string="....- "/>
    <xsl:output-character character="5" string="..... "/>
    <xsl:output-character character="6" string="-.... "/>
    <xsl:output-character character="7" string="--... "/>
    <xsl:output-character character="8" string="---.. "/>
    <xsl:output-character character="9" string="----. "/>
    <xsl:output-character character="0" string="----- "/>
    <xsl:output-character character="." string=".-.-.- "/>
    <xsl:output-character character="," string="--..-- "/>
    <xsl:output-character character=":" string="---... "/>
    <xsl:output-character character="?" string="..--.. "/>
    <xsl:output-character character="'" string=".----. "/>
    <xsl:output-character character="-" string="-....- "/>
    <xsl:output-character character="/" string="-..-. "/>
    <xsl:output-character character="@" string=".--.-. "/>
  </xsl:character-map>
  
  <xsl:output use-character-maps="morse" method="text"/>

  <xsl:template match="/">
    <xsl:variable name="file-as-string">
      <xsl:apply-templates mode="text-only"/>
    </xsl:variable>
    <xsl:value-of select="normalize-space(lower-case($file-as-string))"/>
  </xsl:template>

</xsl:stylesheet>
