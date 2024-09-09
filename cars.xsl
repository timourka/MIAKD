<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Car List</title>
                <style>
                    table {
                        width: 100%;
                        border-collapse: collapse;
                    }
                    table, th, td {
                        border: 1px solid black;
                    }
                    th, td {
                        padding: 10px;
                        text-align: left;
                    }
                    th {
                        background-color: #f2f2f2;
                    }
                </style>
            </head>
            <body>
                <h2>Car List</h2>
                <table>
                    <tr>
                        <th>Brand</th>
                        <th>Model</th>
                        <th>Year</th>
                        <th>Price</th>
                        <th>Engine</th>
                        <th>Color</th>
                    </tr>
                    <xsl:for-each select="cars/car">
                        <tr>
                            <td><xsl:value-of select="brand"/></td>
                            <td><xsl:value-of select="model"/></td>
                            <td><xsl:value-of select="year"/></td>
                            <td><xsl:value-of select="price"/></td>
                            <td><xsl:value-of select="engine"/></td>
                            <td><xsl:value-of select="color"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>