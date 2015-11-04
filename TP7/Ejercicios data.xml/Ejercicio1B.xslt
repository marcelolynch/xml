<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="//projects/project" name="projectT">
   <xsl:value-of select="name" />
</xsl:template>

<xsl:template match="//persons/person" name="">
    <xsl:value-of select="lastname" />, <xsl:value-of select="firstname" /> 
</xsl:template>

<xsl:template match="//client">
    <xsl:value-of select="name" />
</xsl:template>

</xsl:transform>
