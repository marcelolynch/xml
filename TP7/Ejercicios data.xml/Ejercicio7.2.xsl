<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="//projects" />
<xsl:template match="//clients" />

<xsl:template match="//persons">
	<xsl:for-each select="person">
		<xsl:sort select="lastname" />
		<xsl:sort select="firstname" />
		
		<xsl:value-of select="." />
	</xsl:for-each>  
</xsl:template>


</xsl:stylesheet>
