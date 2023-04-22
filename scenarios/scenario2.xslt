<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:key name="langue" match="Langue[parent::Colonie or parent::Groupe or parent::Accueil]" use="."/>
    <xsl:key name="langueColonie" match="Langue[parent::Colonie]" use="."/>
    <xsl:key name="langueGroupe" match="Langue[parent::Groupe]" use="."/>
    <xsl:key name="langueAccueil" match="Langue[parent::Accueil]" use="."/>

    <xsl:key name="pays" match="Pays" use="."/>
    <xsl:key name="paysColonie" match="Pays[ancestor::Colonie]" use="."/>
    <xsl:key name="paysGroupe" match="Pays[ancestor::Groupe]" use="."/>
    <xsl:key name="paysAccueil" match="Pays[ancestor::Accueil]" use="."/>

    <!-- Template principal qui sélectionne tous les séjours -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Statistiques sur les séjours</title>
                <link rel="stylesheet" href="style.css"/>
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lexend"/>
            </head>
            <body>
                <h1 class="title">Statistiques sur les séjours</h1>
                <hr/>
                <!-- STATISTIQUES SUR TOUS TYPES DE SEJOUR -->
                <h1>Statistiques sur tous les types de séjour</h1>
                <h2>Stats sur le nombre de séjours</h2>
                <xsl:variable name="totalSejour" select="count(Sejours/Colonies/Colonie) +
                                count(Sejours/GroupesScolaires/Groupe) +
                                count(Sejours/Accueils/Accueil)"/>
                <p>Nombre total de séjours : <xsl:value-of select="$totalSejour"/></p>

                <h2>Stats sur les jeunes</h2>
                <xsl:variable name="totalAge">
                    <xsl:value-of select="sum(Sejours/Colonies/Colonie/Public/Jeunes/Jeune/Age) +
                                sum(Sejours/GroupesScolaires/Groupe/Public/Jeunes/Jeune/Age) +
                                sum(Sejours/Accueils/Accueil/Public/Jeune/Age)" />
                </xsl:variable>
                <xsl:variable name="totalJeunes">
                    <xsl:value-of select="count(Sejours/Colonies/Colonie/Public/Jeunes/Jeune) +
                                count(Sejours/GroupesScolaires/Groupe/Public/Jeunes/Jeune) +
                                count(Sejours/Accueils/Accueil/Public/Jeune)" />
                </xsl:variable>
                <p>Moyenne d'âge des jeunes : <xsl:value-of select="$totalAge div $totalJeunes"/> ans</p>
                <p>Nombre de jeunes : <xsl:value-of select="$totalJeunes"/></p>

                <xsl:variable name="all_ages" select="//Jeune/Age"/>

                <xsl:variable name="age_min_all">
                    <xsl:for-each select="$all_ages">
                        <xsl:sort data-type="number"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="age_max_all">
                    <xsl:for-each select="$all_ages">
                        <xsl:sort data-type="number" order="descending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                <p>Âge minimum : <xsl:value-of select="$age_min_all"/> ans</p>
                <p>Âge maximum : <xsl:value-of select="$age_max_all"/> ans</p>

                <h2>Stats sur les prix</h2>
                <xsl:variable name="totalPrix">
                    <xsl:value-of select="sum(Sejours/Colonies/Colonie/Prix) +
                                sum(Sejours/GroupesScolaires/Groupe/Prix) +
                                sum(Sejours/Accueils/Accueil/Prix)" />
                </xsl:variable>
                <p>Moyenne des prix : <xsl:value-of select="$totalPrix div $totalSejour"/> €</p>
                <p>Total des prix : <xsl:value-of select="$totalPrix"/> €</p>

                <xsl:variable name="all_prix" select="//Prix"/>

                <xsl:variable name="prix_min_all">
                    <xsl:for-each select="$all_prix">
                        <xsl:sort data-type="number"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="prix_max_all">
                    <xsl:for-each select="$all_prix">
                        <xsl:sort data-type="number" order="descending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                <p>Prix minimum : <xsl:value-of select="$prix_min_all"/> €</p>
                <p>Prix maximum : <xsl:value-of select="$prix_max_all"/> €</p>

                <h2>Stats sur les destinations des séjours</h2>
                <table>
                    <tr>
                        <th>Destinations</th>
                        <th>Nombre d'occurrences</th>
                    </tr>
                    <!-- Pour chaque Langue, on récupère la clé et on compte le nombre d'occurrences -->
                    <xsl:for-each select="//Pays[generate-id() = generate-id(key('pays', .)[1])]">
                        <xsl:sort/>
                        <tr>
                            <td>
                                <xsl:value-of select="."/>
                            </td>
                            <td>
                                <xsl:value-of select="count(key('pays', .))"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>

                <h2>Stats sur les langues des destinations</h2>
                <table>
                    <tr>
                        <th>Langues</th>
                        <th>Nombre d'occurrences</th>
                    </tr>
                    <!-- Pour chaque Langue, on récupère la clé et on compte le nombre d'occurrences -->
                    <xsl:for-each select="//Langue[generate-id() = generate-id(key('langue', .)[1])]">
                        <xsl:sort/>
                        <tr>
                            <td>
                                <xsl:value-of select="."/>
                            </td>
                            <td>
                                <xsl:value-of select="count(key('langue', .))"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <hr/>

                <!-- STATISTIQUES SUR LES COLONIES DE VACANCES -->
                <h1>Statistiques sur toutes les colonies de vacances</h1>
                <h2>Stats sur le nombre de séjours</h2>
                <xsl:variable name="totalSejourColonie" select="count(Sejours/Colonies/Colonie)"/>
                <p>Nombre total de colonies : <xsl:value-of select="$totalSejourColonie"/></p>

                <h2>Stats sur les jeunes</h2>
                <xsl:variable name="totalAgeColonie">
                    <xsl:value-of select="sum(Sejours/Colonies/Colonie/Public/Jeunes/Jeune/Age)" />
                </xsl:variable>
                <xsl:variable name="totalJeunesColonie">
                    <xsl:value-of select="count(Sejours/Colonies/Colonie/Public/Jeunes/Jeune)" />
                </xsl:variable>
                <p>Moyenne d'âge des jeunes : <xsl:value-of select="$totalAgeColonie div $totalJeunesColonie"/> ans</p>
                <p>Nombre de jeunes : <xsl:value-of select="$totalJeunesColonie"/></p>

                <xsl:variable name="all_ages_colonie" select="//Sejours/Colonies/Colonie/Public/Jeunes/Jeune/Age"/>

                <xsl:variable name="age_min_all_colonie">
                    <xsl:for-each select="$all_ages_colonie">
                        <xsl:sort data-type="number"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="age_max_all_colonie">
                    <xsl:for-each select="$all_ages_colonie">
                        <xsl:sort data-type="number" order="descending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                <p>Âge minimum : <xsl:value-of select="$age_min_all_colonie"/> ans</p>
                <p>Âge maximum : <xsl:value-of select="$age_max_all_colonie"/> ans</p>

                <h2>Stats sur les prix</h2>
                <xsl:variable name="totalPrixColonie">
                    <xsl:value-of select="sum(Sejours/Colonies/Colonie/Prix)" />
                </xsl:variable>
                <p>Moyenne des prix : <xsl:value-of select="$totalPrixColonie div $totalSejourColonie"/> €</p>
                <p>Total des prix : <xsl:value-of select="$totalPrixColonie"/> €</p>

                <xsl:variable name="all_prix_colonie" select="//Colonie/Prix"/>

                <xsl:variable name="prix_min_all_colonie">
                    <xsl:for-each select="$all_prix_colonie">
                        <xsl:sort data-type="number"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="prix_max_all_colonie">
                    <xsl:for-each select="$all_prix_colonie">
                        <xsl:sort data-type="number" order="descending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                <p>Prix minimum : <xsl:value-of select="$prix_min_all_colonie"/> €</p>
                <p>Prix maximum : <xsl:value-of select="$prix_max_all_colonie"/> €</p>

                <h2>Stats sur les destinations des séjours</h2>
                <table>
                    <tr>
                        <th>Destinations</th>
                        <th>Nombre d'occurrences</th>
                    </tr>
                    <!-- Pour chaque Langue, on récupère la clé et on compte le nombre d'occurrences -->
                    <xsl:for-each select="//Pays[generate-id() = generate-id(key('paysColonie', .)[1])]">
                        <xsl:sort/>
                        <tr>
                            <td>
                                <xsl:value-of select="."/>
                            </td>
                            <td>
                                <xsl:value-of select="count(key('paysColonie', .))"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>

                <h2>Stats sur les langues des destinations</h2>
                <table>
                    <tr>
                        <th>Langues</th>
                        <th>Nombre d'occurrences</th>
                    </tr>
                    <!-- Pour chaque Langue, on récupère la clé et on compte le nombre d'occurrences -->
                    <xsl:for-each select="//Langue[generate-id() = generate-id(key('langueColonie', .)[1])]">
                        <xsl:sort/>
                        <tr>
                            <td>
                                <xsl:value-of select="."/>
                            </td>
                            <td>
                                <xsl:value-of select="count(key('langueColonie', .))"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>

                <h2>Stats sur les activités</h2>
                <p>Nombre d'activités sportives : <xsl:value-of select="count(//Sportive)"/></p>
                <p>Nombre d'activités culturelles : <xsl:value-of select="count(//Culturelle)"/></p>

                <h2>Stats sur le public</h2>
                <p>Nombre d'animateurs : <xsl:value-of select="count(//Animateur)"/></p>
                <p>Nombre d'intervenants : <xsl:value-of select="count(//Intervenant)"/></p>
                <hr/>

                <!-- STATISTIQUES SUR LES GROUPES SCOLAIRES -->
                <h1>Statistiques sur tous les groupes scolaires</h1>
                <h2>Stats sur le nombre de séjours</h2>
                <xsl:variable name="totalSejourGroupe" select="count(Sejours/GroupesScolaires/Groupe)"/>
                <p>Nombre total de groupes scolaires : <xsl:value-of select="$totalSejourGroupe"/></p>

                <h2>Stats sur les jeunes</h2>
                <xsl:variable name="totalAgeGroupe">
                    <xsl:value-of select="sum(Sejours/GroupesScolaires/Groupe/Public/Jeunes/Jeune/Age)" />
                </xsl:variable>
                <xsl:variable name="totalJeunesGroupe">
                    <xsl:value-of select="count(Sejours/GroupesScolaires/Groupe/Public/Jeunes/Jeune/Age)" />
                </xsl:variable>
                <p>Moyenne d'âge des jeunes : <xsl:value-of select="$totalAgeGroupe div $totalJeunesGroupe"/> ans</p>
                <p>Nombre de jeunes : <xsl:value-of select="$totalJeunesGroupe"/></p>

                <xsl:variable name="all_ages_groupe" select="//Sejours/GroupesScolaires/Groupe/Public/Jeunes/Jeune/Age"/>

                <xsl:variable name="age_min_all_groupe">
                    <xsl:for-each select="$all_ages_groupe">
                        <xsl:sort data-type="number"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="age_max_all_groupe">
                    <xsl:for-each select="$all_ages_groupe">
                        <xsl:sort data-type="number" order="descending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                <p>Âge minimum : <xsl:value-of select="$age_min_all_groupe"/> ans</p>
                <p>Âge maximum : <xsl:value-of select="$age_max_all_groupe"/> ans</p>

                <h2>Stats sur les prix</h2>
                <xsl:variable name="totalPrixGroupe">
                    <xsl:value-of select="sum(Sejours/GroupesScolaires/Groupe/Prix)" />
                </xsl:variable>
                <p>Moyenne des prix : <xsl:value-of select="$totalPrixGroupe div $totalSejourGroupe"/> €</p>
                <p>Total des prix : <xsl:value-of select="$totalPrixGroupe"/> €</p>

                <xsl:variable name="all_prix_groupe" select="//Groupe/Prix"/>

                <xsl:variable name="prix_min_all_groupe">
                    <xsl:for-each select="$all_prix_groupe">
                        <xsl:sort data-type="number"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="prix_max_all_groupe">
                    <xsl:for-each select="$all_prix_groupe">
                        <xsl:sort data-type="number" order="descending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                <p>Prix minimum : <xsl:value-of select="$prix_min_all_groupe"/> €</p>
                <p>Prix maximum : <xsl:value-of select="$prix_max_all_groupe"/> €</p>

                <h2>Stats sur les destinations des séjours</h2>
                <table>
                    <tr>
                        <th>Destinations</th>
                        <th>Nombre d'occurrences</th>
                    </tr>
                    <!-- Pour chaque Langue, on récupère la clé et on compte le nombre d'occurrences -->
                    <xsl:for-each select="//Pays[generate-id() = generate-id(key('paysGroupe', .)[1])]">
                        <xsl:sort/>
                        <tr>
                            <td>
                                <xsl:value-of select="."/>
                            </td>
                            <td>
                                <xsl:value-of select="count(key('paysGroupe', .))"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>

                <h2>Stats sur les langues des destinations</h2>
                <table>
                    <tr>
                        <th>Langues</th>
                        <th>Nombre d'occurrences</th>
                    </tr>
                    <!-- Pour chaque Langue, on récupère la clé et on compte le nombre d'occurrences -->
                    <xsl:for-each select="//Langue[generate-id() = generate-id(key('langueGroupe', .)[1])]">
                        <xsl:sort/>
                        <tr>
                            <td>
                                <xsl:value-of select="."/>
                            </td>
                            <td>
                                <xsl:value-of select="count(key('langueGroupe', .))"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>

                <h2>Stats sur le public</h2>
                <p>Nombre de professeurs : <xsl:value-of select="count(//Professeur)"/></p>
                <p>Nombre de parents accompagnateurs : <xsl:value-of select="count(//Parent)"/></p>
                <hr/>

                <!-- STATISTIQUES SUR LES IMMERSIONS EN FAMILLE D'ACCUEIL -->
                <h1>Statistiques sur toutes les immersions en famille d'accueil</h1>
                <h2>Stats sur le nombre de séjours</h2>
                <xsl:variable name="totalSejourAccueil" select="count(Sejours/Accueils/Accueil)"/>
                <p>Nombre total d'immersions en famille d'accueil : <xsl:value-of select="$totalSejourAccueil"/></p>

                <h2>Stats sur les jeunes</h2>
                <xsl:variable name="totalAgeAccueil">
                    <xsl:value-of select="sum(Sejours/Accueils/Accueil/Public/Jeune/Age)" />
                </xsl:variable>
                <xsl:variable name="totalJeunesAccueil">
                    <xsl:value-of select="count(Sejours/Accueils/Accueil/Public/Jeune/Age)" />
                </xsl:variable>
                <p>Moyenne d'âge des jeunes : <xsl:value-of select="$totalAgeAccueil div $totalJeunesAccueil"/> ans</p>
                <p>Nombre de jeunes : <xsl:value-of select="$totalJeunesAccueil"/></p>

                <xsl:variable name="all_ages_accueil" select="Sejours/Accueils/Accueil/Public/Jeune/Age"/>

                <xsl:variable name="age_min_all_accueil">
                    <xsl:for-each select="$all_ages_accueil">
                        <xsl:sort data-type="number"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="age_max_all_accueil">
                    <xsl:for-each select="$all_ages_accueil">
                        <xsl:sort data-type="number" order="descending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                <p>Âge minimum : <xsl:value-of select="$age_min_all_accueil"/> ans</p>
                <p>Âge maximum : <xsl:value-of select="$age_max_all_accueil"/> ans</p>

                <h2>Stats sur les prix</h2>
                <xsl:variable name="totalPrixAccueil">
                    <xsl:value-of select="sum(Sejours/Accueils/Accueil/Prix)" />
                </xsl:variable>
                <p>Moyenne des prix : <xsl:value-of select="$totalPrixAccueil div $totalSejourAccueil"/> €</p>
                <p>Total des prix : <xsl:value-of select="$totalPrixAccueil"/> €</p>

                <xsl:variable name="all_prix_accueil" select="//Accueil/Prix"/>

                <xsl:variable name="prix_min_all_accueil">
                    <xsl:for-each select="$all_prix_accueil">
                        <xsl:sort data-type="number"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="prix_max_all_accueil">
                    <xsl:for-each select="$all_prix_accueil">
                        <xsl:sort data-type="number" order="descending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                <p>Prix minimum : <xsl:value-of select="$prix_min_all_accueil"/> €</p>
                <p>Prix maximum : <xsl:value-of select="$prix_max_all_accueil"/> €</p>

                <h2>Stats sur les destinations des séjours</h2>
                <table>
                    <tr>
                        <th>Destinations</th>
                        <th>Nombre d'occurrences</th>
                    </tr>
                    <!-- Pour chaque Langue, on récupère la clé et on compte le nombre d'occurrences -->
                    <xsl:for-each select="//Pays[generate-id() = generate-id(key('paysAccueil', .)[1])]">
                        <xsl:sort/>
                        <tr>
                            <td>
                                <xsl:value-of select="."/>
                            </td>
                            <td>
                                <xsl:value-of select="count(key('paysAccueil', .))"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>

                <h2>Stats sur les langues des destinations</h2>
                <table>
                    <tr>
                        <th>Langues</th>
                        <th>Nombre d'occurrences</th>
                    </tr>
                    <!-- Pour chaque Langue, on récupère la clé et on compte le nombre d'occurrences -->
                    <xsl:for-each select="//Langue[generate-id() = generate-id(key('langueAccueil', .)[1])]">
                        <xsl:sort/>
                        <tr>
                            <td>
                                <xsl:value-of select="."/>
                            </td>
                            <td>
                                <xsl:value-of select="count(key('langueAccueil', .))"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <hr/>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>