<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Template principal qui sélectionne toutes les Colonies -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Liste des colonies de vacances</title>
                <link rel="stylesheet" href="style.css"/>
            </head>
            <body>
                <h1>Liste des colonies de vacances</h1>
                <xsl:apply-templates select="Sejours/Colonies/Colonie"/>
            </body>
        </html>
    </xsl:template>

    <!-- Template pour chaque Colonie -->
    <xsl:template match="Colonie">
        <h2><xsl:value-of select="Nom"/></h2>
        <table>
            <tr>
                <th>Pays</th>
                <td><xsl:value-of select="Destination/Pays"/></td>
            </tr>
            <tr>
                <th>Ville</th>
                <td><xsl:value-of select="Destination/Ville"/></td>
            </tr>
            <tr>
                <th>Résidence</th>
                <td><xsl:value-of select="Destination/Residence"/></td>
            </tr>
            <tr>
                <th>Date de début</th>
                <td><xsl:value-of select="Destination/DateDebut"/></td>
            </tr>
            <tr>
                <th>Date de fin</th>
                <td><xsl:value-of select="Destination/DateFin"/></td>
            </tr>
            <tr>
                <th>Prix</th>
                <td><xsl:value-of select="Prix"/> €</td>
            </tr>
            <tr>
                <th>Langue</th>
                <td><xsl:value-of select="Langue"/></td>
            </tr>
        </table>
    </xsl:template>

</xsl:stylesheet>
