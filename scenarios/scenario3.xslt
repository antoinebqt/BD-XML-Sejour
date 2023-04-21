<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Template principal qui sélectionne tous les séjours -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Liste des séjours</title>
                <link rel="stylesheet" href="style.css"/>
            </head>
            <body>
                <h1>Liste des colonies de vacances</h1>
                <xsl:apply-templates select="Sejours/Colonies/Colonie"/>

                <h1>Liste des groupes scolaires</h1>
                <xsl:apply-templates select="Sejours/GroupesScolaires/Groupe"/>

                <h1>Liste des immersions en familles</h1>
                <xsl:apply-templates select="Sejours/Accueils/Accueil"/>
            </body>
        </html>
    </xsl:template>

    <!-- Template pour chaque colonie -->
    <xsl:template match="Colonie">
        <table>
            <thead>
                <tr>
                    <th colspan="2"><xsl:value-of select="Nom"/></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>Référence</th>
                    <td>
                        <xsl:value-of select="@Reference"/>
                    </td>
                </tr>
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
                <xsl:if test="count(Activites/Sportive) &gt; 0">
                    <tr>
                        <th>Activité(s) sportive(s)</th>
                        <td><xsl:for-each select="Activites/Sportive">
                            <table>
                                <tr>
                                    <th colspan="2"><xsl:value-of select="Sport"/></th>
                                </tr>
                                <tr>
                                    <th>Lieu</th>
                                    <td><xsl:value-of select="Lieu"/></td>
                                </tr>
                                <tr>
                                    <th>Date</th>
                                    <td><xsl:value-of select="Date"/></td>
                                </tr>
                                <tr>
                                    <th>Durée</th>
                                    <td><xsl:value-of select="Duree"/></td>
                                </tr>
                            </table>
                        </xsl:for-each></td>
                    </tr>
                </xsl:if>
                <xsl:if test="count(Activites/Culturelle) &gt; 0">
                    <tr>
                        <th>Activité(s) culturelle(s)</th>
                        <td><xsl:for-each select="Activites/Culturelle">
                            <table>
                                <tr>
                                    <th colspan="2"><xsl:value-of select="Nom"/></th>
                                </tr>
                                <tr>
                                    <th>Lieu</th>
                                    <td><xsl:value-of select="Lieu"/></td>
                                </tr>
                                <tr>
                                    <th>Date</th>
                                    <td><xsl:value-of select="Date"/></td>
                                </tr>
                                <tr>
                                    <th>Durée</th>
                                    <td><xsl:value-of select="Duree"/></td>
                                </tr>
                            </table>
                        </xsl:for-each></td>
                    </tr>
                </xsl:if>
                <tr>
                    <th>Animateur(s)</th>
                    <td>
                        <xsl:for-each select="Public/Adultes/Animateurs/Animateur">
                            <p>
                                <xsl:value-of select="Prenom"/><xsl:text> </xsl:text><xsl:value-of select="Nom"/>, <xsl:value-of select="Age"/> ans
                            </p>
                        </xsl:for-each>
                    </td>
                </tr>
                <xsl:if test="count(Public/Adultes/Intervenants/Intervenant) &gt; 0">
                    <tr>
                        <th>Intervenants(s)</th>
                        <td><xsl:for-each select="Public/Adultes/Intervenants/Intervenant">
                            <p>
                                <xsl:value-of select="Prenom"/><xsl:text> </xsl:text><xsl:value-of select="Nom"/>, <xsl:value-of select="Age"/> ans (<xsl:value-of select="Occupation"/>)
                            </p>
                        </xsl:for-each></td>
                    </tr>
                </xsl:if>
                <tr>
                    <th>Jeune(s)</th>
                    <td>
                        <xsl:for-each select="Public/Jeunes/Jeune">
                            <p>
                                <xsl:value-of select="Prenom"/><xsl:text> </xsl:text><xsl:value-of select="Nom"/>, <xsl:value-of select="Age"/> ans
                            </p>
                        </xsl:for-each>
                    </td>
                </tr>
            </tbody>
        </table>
    </xsl:template>

    <!-- Template pour chaque groupe scolaire -->
    <xsl:template match="Groupe">
        <table>
            <thead>
                <tr>
                    <th colspan="2"><xsl:value-of select="Nom"/></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>Référence</th>
                    <td>
                        <xsl:value-of select="@Reference"/>
                    </td>
                </tr>
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
                <xsl:if test="count(Activites/QuizLangue) &gt; 0">
                    <tr>
                        <th>Quiz de langue</th>
                        <td><xsl:for-each select="Activites/QuizLangue">
                            <table>
                                <tr>
                                    <th colspan="2"><xsl:value-of select="Nom"/></th>
                                </tr>
                                <tr>
                                    <th>Langue</th>
                                    <td><xsl:value-of select="Langue"/></td>
                                </tr>
                                <tr>
                                    <th>Date</th>
                                    <td><xsl:value-of select="Date"/></td>
                                </tr>
                                <tr>
                                    <th>Durée</th>
                                    <td><xsl:value-of select="Duree"/></td>
                                </tr>
                                <tr>
                                    <th>Nombre de questions</th>
                                    <td><xsl:value-of select="NombreQuestion"/></td>
                                </tr>
                            </table>
                        </xsl:for-each></td>
                    </tr>
                </xsl:if>
                <xsl:if test="count(Activites/CoursLangue) &gt; 0">
                    <tr>
                        <th>Cour(s) de langue</th>
                        <td><xsl:for-each select="Activites/CoursLangue">
                            <table>
                                <tr>
                                    <th colspan="2"><xsl:value-of select="Langue"/></th>
                                </tr>
                                <tr>
                                    <th>Date</th>
                                    <td><xsl:value-of select="Date"/></td>
                                </tr>
                                <tr>
                                    <th>Durée</th>
                                    <td><xsl:value-of select="Duree"/></td>
                                </tr>
                                <tr>
                                    <th>Professeur</th>
                                    <td><xsl:value-of select="//Professeur[@idProfesseur=current()/ProfesseurId]/Prenom"/><xsl:text> </xsl:text><xsl:value-of select="//Professeur[@idProfesseur=current()/ProfesseurId]/Nom"/>, <xsl:value-of select="//Professeur[@idProfesseur=current()/ProfesseurId]/Age"/> ans</td>
                                </tr>
                            </table>
                        </xsl:for-each></td>
                    </tr>
                </xsl:if>
                <tr>
                    <th>Professeur(s)</th>
                    <td>
                        <xsl:for-each select="Public/Adultes/Professeurs/Professeur">
                            <p>
                                <xsl:value-of select="Prenom"/><xsl:text> </xsl:text><xsl:value-of select="Nom"/>, <xsl:value-of select="Age"/> ans (<xsl:value-of select="Matiere"/>)
                            </p>
                        </xsl:for-each>
                    </td>
                </tr>
                <xsl:if test="count(Public/Adultes/ParentsAccompagnateur/Parent) &gt; 0">
                    <tr>
                        <th>Parent(s) accompagnateur(s)</th>
                        <td><xsl:for-each select="Public/Adultes/ParentsAccompagnateur/Parent">
                            <p>
                                <xsl:value-of select="Prenom"/><xsl:text> </xsl:text><xsl:value-of select="Nom"/>, <xsl:value-of select="Age"/> ans (Parent de <xsl:value-of select="//Jeune[@idJeune=current()/JeuneId]/Prenom"/><xsl:text> </xsl:text><xsl:value-of select="//Jeune[@idJeune=current()/JeuneId]/Nom"/>)
                            </p>
                        </xsl:for-each></td>
                    </tr>
                </xsl:if>
                <tr>
                    <th>Jeune(s)</th>
                    <td>
                        <xsl:for-each select="Public/Jeunes/Jeune">
                            <p>
                                <xsl:value-of select="Prenom"/><xsl:text> </xsl:text><xsl:value-of select="Nom"/>, <xsl:value-of select="Age"/> ans
                            </p>
                        </xsl:for-each>
                    </td>
                </tr>
            </tbody>
        </table>
    </xsl:template>

    <!-- Template pour chaque immersion dans une famille -->
    <xsl:template match="Accueil">
        <table>
            <thead>
                <tr>
                    <th colspan="2"><xsl:value-of select="Nom"/></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>Référence</th>
                    <td>
                        <xsl:value-of select="@Reference"/>
                    </td>
                </tr>
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
                <tr>
                    <th>Famille</th>
                    <td>
                        <xsl:for-each select="Public/Famille/Adultes/Adulte">
                            <p>
                                <xsl:value-of select="Prenom"/><xsl:text> </xsl:text><xsl:value-of select="Nom"/>, <xsl:value-of select="Age"/> ans (<xsl:value-of select="@role"/>)
                            </p>
                        </xsl:for-each>
                        <xsl:for-each select="Public/Famille/Jeunes/Jeune">
                            <p>
                                <xsl:value-of select="Prenom"/><xsl:text> </xsl:text><xsl:value-of select="Nom"/>, <xsl:value-of select="Age"/> ans
                            </p>
                        </xsl:for-each>
                    </td>
                </tr>
                <tr>
                    <th>Jeune accueilli</th>
                    <td><xsl:value-of select="Public/Jeune/Prenom"/><xsl:text> </xsl:text><xsl:value-of select="Public/Jeune/Nom"/>, <xsl:value-of select="Public/Jeune/Age"/> ans</td>
                </tr>
            </tbody>
        </table>
    </xsl:template>
</xsl:stylesheet>