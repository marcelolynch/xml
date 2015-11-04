<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:param name="libroID" />
<xsl:template match="//usuarios" />
<xsl:template match="//libros/libro">
    <xsl:if test="@id = $libroID">
      <html>
        <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
          <title><xsl:value-of select="titulo" /></title>
        </head>
        <body>
          <h1><xsl:value-of select="titulo" /></h1>
          <h3>Autor</h3> <p><xsl:value-of select="autor" /></p>
          <h3>ISBN</h3>
          <p><xsl:value-of select="isbn" /></p>
          <h3>Descripcion</h3>
          <p><xsl:value-of select="descripcion" /></p>
        </body>
      </html>
    </xsl:if>
</xsl:template>
</xsl:stylesheet>
