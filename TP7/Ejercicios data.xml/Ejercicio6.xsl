<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="//projects" />
<xsl:template match="//clients" />
<xsl:template match="//person">
	<xsl:element name="person">
	  <xsl:attribute name="document">
	    <xsl:value-of select="document" />
	  </xsl:attribute>
	  <xsl:attribute name="firstname">
	    <xsl:value-of select="firstname" />
	  </xsl:attribute>
	  <xsl:attribute name="lastname">
	    <xsl:value-of select="lastname" />
	  </xsl:attribute>
	  <xsl:attribute name="age">
	    <xsl:value-of select="age" />
	  </xsl:attribute>
	</xsl:element>
</xsl:template>
</xsl:stylesheet>

