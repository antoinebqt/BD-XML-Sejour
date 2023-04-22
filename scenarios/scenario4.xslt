<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <Utilisateurs>
            <xsl:apply-templates select="//Animateur | //Intervenant | //Jeune | //Professeur | //Parent | //Membre">
                <xsl:sort select="Nom"/>
            </xsl:apply-templates>
        </Utilisateurs>
    </xsl:template>

    <xsl:template match="Animateur | Intervenant | Jeune | Professeur | Parent | Membre">
        <Utilisateur>
            <NOM>
                <xsl:value-of select="Nom"/>
            </NOM>
            <PRENOM>
                <xsl:value-of select="Prenom"/>
            </PRENOM>
            <AGE>
                <xsl:value-of select="Age"/>
            </AGE>
        </Utilisateur>
    </xsl:template>

</xsl:stylesheet>
