<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" indent="yes"/>

    <!-- Template principal -->
    <xsl:template match="/">
        <xsl:text>{&#xA; "Jeunes": [</xsl:text>
        <xsl:apply-templates select="//Jeune"/>
        <xsl:text>]&#xA;}</xsl:text>
    </xsl:template>

    <!-- Template pour chaque élément Jeune -->
    <xsl:template match="Jeune">
        <xsl:if test="position() > 1">,&#xA;</xsl:if>
        <xsl:text>{&#xA;"Nom": "</xsl:text><xsl:value-of select="Nom"/><xsl:text>", &#xA;"Prenom": "</xsl:text><xsl:value-of select="Prenom"/><xsl:text>",&#xA;"Age": "</xsl:text><xsl:value-of select="Age"/><xsl:text>"&#xA;}</xsl:text>
    </xsl:template>

    <!-- Template pour chaque élément Colonie contenant des Jeunes -->
    <xsl:template match="Colonie[Jeunes/Jeune]">
        <xsl:apply-templates select="//Jeune"/>
    </xsl:template>

    <!-- Template pour chaque élément Groupe contenant des Jeunes -->
    <xsl:template match="Groupe[Jeunes/Jeune]">
        <xsl:apply-templates select="//Jeune"/>
    </xsl:template>

    <!-- Template pour chaque élément Accueil contenant des Jeunes -->
    <xsl:template match="Accueil[Jeunes/Jeune]">
        <xsl:apply-templates select="//Jeune"/>
    </xsl:template>

</xsl:stylesheet>
