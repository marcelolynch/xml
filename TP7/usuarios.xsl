<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="//libros" />
<xsl:template match="//usuarios">
      <html>
        <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
          <title>Usuarios</title>
        </head>
        <body>
          <table border="1">
           <tr>
            <th>Nombre</th>
            <th>Direccion</th>
            <th>Telefono</th>
            <th>Prestamos</th>
           </tr>
      <tbody>
         <xsl:for-each select="usuario">
            <xsl:variable name="userID"><xsl:value-of select="@id" /></xsl:variable>
            <tr>
               <td><xsl:value-of select="datos_personales/nombre"/></td>
               <td><xsl:value-of select="datos_personales/direccion"/></td>
               <td><xsl:value-of select="datos_personales/telefono"/></td>
               <td><a href="prestamos_{$userID}.html">Prestamos</a></td>
            </tr>
         </xsl:for-each>
            </tbody>
           </table>
        </body>
      </html>
</xsl:template>
</xsl:stylesheet>
