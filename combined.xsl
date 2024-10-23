<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <title>Brands and Laptops List</title>
        <style>
          body { font-family: Arial, sans-serif; }
          h2 { color: #333; }
          table { border-collapse: collapse; width: 100%; margin-bottom: 30px; }
          table, th, td { border: 1px solid black; }
          th, td { padding: 8px; text-align: left; }
          th { background-color: #f2f2f2; }
        </style>
      </head>
      <body>
        <h2>List of Brands</h2>
        <table>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Country</th>
          </tr>
          <xsl:for-each select="data/brands/brand">
            <tr>
              <td><xsl:value-of select="id"/></td>
              <td><xsl:value-of select="name"/></td>
              <td><xsl:value-of select="country"/></td>
            </tr>
          </xsl:for-each>
        </table>

        <h2>List of Laptops</h2>
        <table>
          <tr>
            <th>ID</th>
            <th>Model</th>
            <th>Price</th>
            <th>Release Date</th>
            <th>Brand ID</th>
            <th>Brand Name</th>
          </tr>
          <xsl:for-each select="data/laptops/laptop">
            <tr>
              <td><xsl:value-of select="id"/></td>
              <td><xsl:value-of select="model"/></td>
              <td><xsl:value-of select="price"/></td>
              <td><xsl:value-of select="release_date"/></td>
              <td><xsl:value-of select="brand_id"/></td>
              <td>
                <xsl:value-of select="/data/brands/brand[id=current()/brand_id]/name"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
