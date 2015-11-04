<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="//projects" />
<xsl:template match="//clients" />

<xsl:template match="//persons">
	<xsl:for-each select="person">
		<xsl:value-of select="name" />
		<xsl:choose>
			<xsl:when test="count(.//person) gt 3 and count(.//person) lt 5" />
		</xsl:choose>

	</xsl:for-each>  
</xsl:template>


</xsl:stylesheet>
