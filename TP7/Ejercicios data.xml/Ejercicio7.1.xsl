<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="//projects" />
<xsl:template match="//persons" />

<xsl:template match="//clients">
	<xsl:for-each select="client">
   	  <xsl:sort select="name" />
	  <xsl:value-of select="name" />
	  <xsl:text> </xsl:text>
	</xsl:for-each>
</xsl:template>

</xsl:stylesheet>

