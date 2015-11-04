<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="//clients" />
<xsl:template match="//persons" />

<xsl:template match="//projects">
	<xsl:for-each select="project">
	  <xsl:value-of select="name" />
		<xsl:text>&#xa;</xsl:text>
		<xsl:choose>		
			<xsl:when test="count(.//person) ge 3 and count(.//person) le 5">
				<xsl:text>Proyecto con entre 3 y 5 integrantes</xsl:text>
			</xsl:when>
			<xsl:when test="count(.//person) gt 5">
				<xsl:text>Proyecto con mas de 5 integrantes</xsl:text>
			</xsl:when>
			<xsl:when test="count(.//person) lt 3">
				<xsl:text>Proyecto con menos de 3</xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:text>&#xa;</xsl:text>
	</xsl:for-each>
</xsl:template>

</xsl:stylesheet>

