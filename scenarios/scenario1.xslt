<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Colonies et intervenants</title>
                <style>
                    /* Style pour la table */
                    table {
                    border-collapse: collapse;
                    width: 100%;
                    margin-bottom: 20px;
                    }
                    th, td {
                    text-align: left;
                    padding: 8px;
                    border: 1px solid black;
                    }
                    th {
                    background-color: #4CAF50;
                    color: white;
                    }
                    tr:nth-child(even) {
                    background-color: #f2f2f2;
                    }
                    p {
                    font-weight: bold;
                    font-size: 1.2em;
                    margin: 10px 0;
                    }
                </style>
            </head>
            <body>
                <xsl:apply-templates select="//Colonie"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="Colonie">
        <h2><xsl:value-of select="Nom"/></h2>
        <xsl:variable name="intervenants" select="Public/Adultes/Intervenants/Intervenant" />
        <xsl:if test="$intervenants">
            <!-- Affichage des lieux sportifs -->
            <xsl:variable name="lieuxSportifs" select="Activites/Sportive/Lieu"/>
            <xsl:if test="$lieuxSportifs">
                <p>Les localisations sportives sont :</p>
                <ul>
                    <xsl:for-each select="$lieuxSportifs">
                        <li><xsl:value-of select="."/></li>
                    </xsl:for-each>
                </ul>
            </xsl:if>

            <!-- Affichage des lieux culturels -->
            <xsl:variable name="lieuxCulturels" select="Activites/Culturelle/Lieu"/>
            <xsl:if test="$lieuxCulturels">
                <p>Les localisations culturelles sont :</p>
                <ul>
                    <xsl:for-each select="$lieuxCulturels">
                        <li><xsl:value-of select="."/></li>
                    </xsl:for-each>
                </ul>
            </xsl:if>

            <table>
                <tr>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Age</th>
                    <th>Occupation</th>
                </tr>
                <xsl:for-each select="$intervenants">
                    <tr>
                        <td><xsl:value-of select="Nom"/></td>
                        <td><xsl:value-of select="Prenom"/></td>
                        <td><xsl:value-of select="Age"/></td>
                        <td><xsl:value-of select="Occupation"/></td>
                    </tr>
                </xsl:for-each>
            </table>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
