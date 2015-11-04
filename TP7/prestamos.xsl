<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:param name="usuarioID" />
<xsl:template match="//libros" />
<xsl:template match="//usuarios/usuario">
    <xsl:value-of select="nombre" />
    <xsl:if test="@id = $usuarioID">
      <xsl:variable name="titulo">
        Prestamos de <xsl:value-of select="datos_personales/nombre" />
      </xsl:variable>
      <html>
        <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
          <title><xsl:value-of select="$titulo" /></title>
        </head>
        <body>
          <h1><xsl:value-of select="$titulo" /></h1>
          <table border="1">
             <tr>
                <th>Libro</th>
                <th>Fecha de prestamo</th>
                <th>Fecha de devolucion</th>
             </tr>
            <tbody>
                <xsl:for-each select=".//prestamos/prestamo">
                    <xsl:variable name="idLibro">
                        <xsl:value-of select="libro_prestado/@id" />
                    </xsl:variable>                    
                    <xsl:variable name="titLibro">
                        <xsl:value-of select="//libros/libro[@id = $idLibro]/titulo" />
                    </xsl:variable>                    
                    <tr>
                     <td><a href="{$idLibro}.html"><xsl:value-of select="$titLibro" /></a></td>
                     <td><xsl:value-of select="fecha_perstamo"/></td>
                     <td><xsl:value-of select="fecha_devolucion"/></td>
                    </tr>
                </xsl:for-each>
            </tbody>
           </table>
        </body>
      </html>
    </xsl:if>
</xsl:template>
</xsl:stylesheet>
