<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Template principal qui sélectionne tous les séjours -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Liste des séjours en Angleterre</title>
                <link rel="stylesheet" href="style.css"/>
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lexend"/>
            </head>
            <body>
                <h1 class="title">Liste des séjours en Angleterre</h1>
                <hr/>
                <h1>Liste des colonies de vacances en Angleterre</h1>
                <xsl:apply-templates select="Sejours/Colonies/Colonie[Destination/Pays='Angleterre']"/>

                <h1>Liste des groupes scolaires en Angleterre</h1>
                <xsl:apply-templates select="Sejours/GroupesScolaires/Groupe[Destination/Pays='Angleterre']"/>

                <h1>Liste des immersions en familles en Angleterre</h1>
                <xsl:apply-templates select="Sejours/Accueils/Accueil[Destination/Pays='Angleterre']"/>
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
                    <td>Référence</td>
                    <td>
                        <xsl:value-of select="@Reference"/>
                    </td>
                </tr>
                <tr>
                    <td>Pays</td>
                    <td><xsl:value-of select="Destination/Pays"/></td>
                </tr>
                <tr>
                    <td>Ville</td>
                    <td><xsl:value-of select="Destination/Ville"/></td>
                </tr>
                <tr>
                    <td>Résidence</td>
                    <td><xsl:value-of select="Destination/Residence"/></td>
                </tr>
                <tr>
                    <td>Date de début</td>
                    <td><xsl:value-of select="Destination/DateDebut"/></td>
                </tr>
                <tr>
                    <td>Date de fin</td>
                    <td><xsl:value-of select="Destination/DateFin"/></td>
                </tr>
                <tr>
                    <td>Prix</td>
                    <td><xsl:value-of select="Prix"/> €</td>
                </tr>
                <tr>
                    <td>Langue</td>
                    <td><xsl:value-of select="Langue"/></td>
                </tr>
                <xsl:if test="count(Activites/Sportive) &gt; 0">
                    <tr>
                        <td>Activité(s) sportive(s)</td>
                        <td><xsl:for-each select="Activites/Sportive">
                            <table>
                                <tr>
                                    <th colspan="2"><xsl:value-of select="Sport"/></th>
                                </tr>
                                <tr>
                                    <td>Lieu</td>
                                    <td><xsl:value-of select="Lieu"/></td>
                                </tr>
                                <tr>
                                    <td>Date</td>
                                    <td><xsl:value-of select="Date"/></td>
                                </tr>
                                <tr>
                                    <td>Durée</td>
                                    <td><xsl:value-of select="Duree"/></td>
                                </tr>
                            </table>
                        </xsl:for-each></td>
                    </tr>
                </xsl:if>
                <xsl:if test="count(Activites/Culturelle) &gt; 0">
                    <tr>
                        <td>Activité(s) culturelle(s)</td>
                        <td><xsl:for-each select="Activites/Culturelle">
                            <table>
                                <tr>
                                    <th colspan="2"><xsl:value-of select="Nom"/></th>
                                </tr>
                                <tr>
                                    <td>Lieu</td>
                                    <td><xsl:value-of select="Lieu"/></td>
                                </tr>
                                <tr>
                                    <td>Date</td>
                                    <td><xsl:value-of select="Date"/></td>
                                </tr>
                                <tr>
                                    <td>Durée</td>
                                    <td><xsl:value-of select="Duree"/></td>
                                </tr>
                            </table>
                        </xsl:for-each></td>
                    </tr>
                </xsl:if>
                <tr>
                    <td>Animateur(s)</td>
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
                        <td>Intervenants(s)</td>
                        <td><xsl:for-each select="Public/Adultes/Intervenants/Intervenant">
                            <p>
                                <xsl:value-of select="Prenom"/><xsl:text> </xsl:text><xsl:value-of select="Nom"/>, <xsl:value-of select="Age"/> ans (<xsl:value-of select="Occupation"/>)
                            </p>
                        </xsl:for-each></td>
                    </tr>
                </xsl:if>
                <tr>
                    <td>Jeune(s)</td>
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
        <hr/>
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
                    <td>Référence</td>
                    <td>
                        <xsl:value-of select="@Reference"/>
                    </td>
                </tr>
                <tr>
                    <td>Pays</td>
                    <td><xsl:value-of select="Destination/Pays"/></td>
                </tr>
                <tr>
                    <td>Ville</td>
                    <td><xsl:value-of select="Destination/Ville"/></td>
                </tr>
                <tr>
                    <td>Résidence</td>
                    <td><xsl:value-of select="Destination/Residence"/></td>
                </tr>
                <tr>
                    <td>Date de début</td>
                    <td><xsl:value-of select="Destination/DateDebut"/></td>
                </tr>
                <tr>
                    <td>Date de fin</td>
                    <td><xsl:value-of select="Destination/DateFin"/></td>
                </tr>
                <tr>
                    <td>Prix</td>
                    <td><xsl:value-of select="Prix"/> €</td>
                </tr>
                <tr>
                    <td>Langue</td>
                    <td><xsl:value-of select="Langue"/></td>
                </tr>
                <xsl:if test="count(Activites/QuizLangue) &gt; 0">
                    <tr>
                        <td>Quiz de langue</td>
                        <td><xsl:for-each select="Activites/QuizLangue">
                            <table>
                                <tr>
                                    <th colspan="2"><xsl:value-of select="Nom"/></th>
                                </tr>
                                <tr>
                                    <td>Langue</td>
                                    <td><xsl:value-of select="Langue"/></td>
                                </tr>
                                <tr>
                                    <td>Date</td>
                                    <td><xsl:value-of select="Date"/></td>
                                </tr>
                                <tr>
                                    <td>Durée</td>
                                    <td><xsl:value-of select="Duree"/></td>
                                </tr>
                                <tr>
                                    <td>Nombre de questions</td>
                                    <td><xsl:value-of select="NombreQuestion"/></td>
                                </tr>
                            </table>
                        </xsl:for-each></td>
                    </tr>
                </xsl:if>
                <xsl:if test="count(Activites/CoursLangue) &gt; 0">
                    <tr>
                        <td>Cour(s) de langue</td>
                        <td><xsl:for-each select="Activites/CoursLangue">
                            <table>
                                <tr>
                                    <th colspan="2"><xsl:value-of select="Langue"/></th>
                                </tr>
                                <tr>
                                    <td>Date</td>
                                    <td><xsl:value-of select="Date"/></td>
                                </tr>
                                <tr>
                                    <td>Durée</td>
                                    <td><xsl:value-of select="Duree"/></td>
                                </tr>
                                <tr>
                                    <td>Professeur</td>
                                    <td><xsl:value-of select="//Professeur[@idProfesseur=current()/ProfesseurId]/Prenom"/><xsl:text> </xsl:text><xsl:value-of select="//Professeur[@idProfesseur=current()/ProfesseurId]/Nom"/>, <xsl:value-of select="//Professeur[@idProfesseur=current()/ProfesseurId]/Age"/> ans</td>
                                </tr>
                            </table>
                        </xsl:for-each></td>
                    </tr>
                </xsl:if>
                <tr>
                    <td>Professeur(s)</td>
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
                        <td>Parent(s) accompagnateur(s)</td>
                        <td><xsl:for-each select="Public/Adultes/ParentsAccompagnateur/Parent">
                            <p>
                                <xsl:value-of select="Prenom"/><xsl:text> </xsl:text><xsl:value-of select="Nom"/>, <xsl:value-of select="Age"/> ans (Parent de <xsl:value-of select="//Jeune[@idJeune=current()/JeuneId]/Prenom"/><xsl:text> </xsl:text><xsl:value-of select="//Jeune[@idJeune=current()/JeuneId]/Nom"/>)
                            </p>
                        </xsl:for-each></td>
                    </tr>
                </xsl:if>
                <tr>
                    <td>Jeune(s)</td>
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
        <hr/>
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
                    <td>Référence</td>
                    <td>
                        <xsl:value-of select="@Reference"/>
                    </td>
                </tr>
                <tr>
                    <td>Pays</td>
                    <td><xsl:value-of select="Destination/Pays"/></td>
                </tr>
                <tr>
                    <td>Ville</td>
                    <td><xsl:value-of select="Destination/Ville"/></td>
                </tr>
                <tr>
                    <td>Résidence</td>
                    <td><xsl:value-of select="Destination/Residence"/></td>
                </tr>
                <tr>
                    <td>Date de début</td>
                    <td><xsl:value-of select="Destination/DateDebut"/></td>
                </tr>
                <tr>
                    <td>Date de fin</td>
                    <td><xsl:value-of select="Destination/DateFin"/></td>
                </tr>
                <tr>
                    <td>Prix</td>
                    <td><xsl:value-of select="Prix"/> €</td>
                </tr>
                <tr>
                    <td>Langue</td>
                    <td><xsl:value-of select="Langue"/></td>
                </tr>
                <tr>
                    <td>Famille</td>
                    <td>
                        <xsl:for-each select="Public/Famille/Membre">
                            <p>
                                <xsl:value-of select="Prenom"/><xsl:text> </xsl:text><xsl:value-of select="Nom"/>, <xsl:value-of select="Age"/> ans (<xsl:value-of select="@role"/>)
                            </p>
                        </xsl:for-each>
                    </td>
                </tr>
                <tr>
                    <td>Jeune accueilli</td>
                    <td><xsl:value-of select="Public/Jeune/Prenom"/><xsl:text> </xsl:text><xsl:value-of select="Public/Jeune/Nom"/>, <xsl:value-of select="Public/Jeune/Age"/> ans</td>
                </tr>
            </tbody>
        </table>
        <hr/>
    </xsl:template>
</xsl:stylesheet>