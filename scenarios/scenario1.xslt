<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Activités et intervenants des colonies</title>
                <link rel="stylesheet" href="style.css"/>
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lexend"/>
            </head>
            <body>
                <h1 class="title">Activités et intervenants des colonies</h1>
                <hr/>
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
                <p>Localisations des activités sportives :</p>
                <ul>
                    <xsl:for-each select="$lieuxSportifs">
                        <li><xsl:value-of select="."/></li>
                    </xsl:for-each>
                </ul>
            </xsl:if>

            <!-- Affichage des lieux culturels -->
            <xsl:variable name="lieuxCulturels" select="Activites/Culturelle/Lieu"/>
            <xsl:if test="$lieuxCulturels">
                <p>Localisations des activités culturelles :</p>
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
            <hr/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
