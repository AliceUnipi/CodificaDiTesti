<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    <xsl:template match="/">
    <!-- Match con tutto il documento -->
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='fr']"/></title>

                <link rel="preconnect" href="https://fonts.googleapis.com"/> 
                <link rel="preconnect" href="https://fonts.gstatic.com"/> 
                <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100display=swap" rel="stylesheet"/>             
                    
                <link rel="stylesheet" type="text/css" href="grafica.css" />
            </head>
            <body>
                <!-- Header -->
                <header>
                    <div id="menu">
                        <h1><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='fr']" /></h1>
                        <ul class="navbar">
                            <li><a href="#descrizione">Descrizione</a></li>
                            <li><a href="##pagina25">Pagina 25</a></li>
                            <li><a href="##pagina26">Pagina 26</a></li>
                            <li><a href="#terminologia">Terminologia</a></li>
                            <li><a href="#bibliografia">Bibliografia</a></li>
                            <li><a href="#riferimenti">Riferimenti</a></li>
                        </ul>
                    </div>
                </header>
                <main>
                    <!-- Informazioni titolo -->
                    <section id="title">
                        <h1><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='fr']"/></h1>
                        <h3>Autore:<xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"/></h3>
                    </section>

                    <!-- Caratteristiche -->

                    <!-- Sezione autore -->
                    <section id="informazioni" class="info">
                        <img src="ferdinandS.jpg" alt="author_img" />
                        <div id="bio" class="card_descrizione">
                            <xsl:apply-templates select="//tei:listPerson" /> 
                        </div>
                    </section>

                    <!-- Sezione info generali -->
                    <section class="info">
                        <div class="card_descrizione">
                            <xsl:apply-templates select="//tei:msContents" />  
                        </div>
                    </section>

                    <!-- Sezione descrizione fisica -->
                    <section class="info2" id="descrizione">
                        <div class="card_descrizione">
                            <xsl:apply-templates select="//tei:physDesc" />
                        </div>
                    </section>

                    <!-- Sezione storia editoriale -->
                    <section class="descrizione">
                        <div>
                            <img src="ginevra.jpg" alt="università_ginevra_img"/>
                        </div>
                        <div class="card_descrizione">
                            <xsl:apply-templates select="//tei:history" />
                        </div>
                    </section>
                    
                    <!-- Sezione foto pagine originali-->
                    <section id="foto_codifica">
                        <div id="foto" class="card_descrizione">
                            <xsl:apply-templates select="//tei:facsimile" />
                            <span id="testo_foto"></span>
                        </div>
                    </section>

                    <!-- Lista bottoni -->
                    <div id="lista_bottoni">
                        <h2> Visualizza gli elementi nel testo</h2>
                        <button type="button" id="cancellazione">Cancellature</button>
                        <button type="button" id="correzione">Correzioni</button>
                        <button type="button" id="termini">Terminologia</button>
                        <button type="button" id="aggiunta">Aggiunte</button>   
                        <button type="button" id="glottonimo">Glottonimi</button>
                        <button type="button" id="toponimo">Toponimi</button>
                        <button type="button" id="abbreviazione">Abbreviazione</button>
                    </div>

                    <!-- Pagine 25 e 26 -->
                    <section id="pagine25e26">
                        <!-- Pagina 25 -->
                        <div class="pagina">
                            <xsl:attribute name="id">
                                <xsl:value-of select="//tei:div[@n='25']/@facs"/>
                            </xsl:attribute>
                            <h2>Pagina 25</h2>
                            <div class="testo_pagina">
                                <div class="testo">
                                    <h3>Trascrizione testo originale</h3>
                                    <xsl:apply-templates select="//tei:div[@n = '25']" />
                                </div>
                                <div class="testo">
                                    <h3>Traduzione italiana</h3>
                                    <xsl:apply-templates select="//tei:div[@type = 'traduzionepag25']" />
                                </div>
                            </div>
                        </div>

                        <!-- Pagina 26 -->
                        <div class="pagina">
                            <xsl:attribute name="id">
                                <xsl:value-of select="//tei:div[@n='26']/@facs"/>
                            </xsl:attribute>
                            <h2>Pagina 26</h2>
                            <div class="testo_pagina">
                                <div class="testo">
                                    <h3>Trascrizione testo originale</h3>
                                    <xsl:apply-templates select="//tei:div[@n = '26']" />
                                </div>
                                <div class="testo">
                                    <h3>Traduzione italiana</h3>
                                    <xsl:apply-templates select="//tei:div[@type = 'traduzionepag26']" />
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- Appendice -->
                    <section id="terminologia">
                        <div class="card_descrizione">
                            <xsl:apply-templates select="//tei:back/tei:div/tei:list" />
                        </div>
                    </section>

                    <!-- Scroll top -->
                    <div id="scroll_top">
                        <button onclick="topFunction()" id="myBtn" title="Go to top">Torna su</button>
                    </div>

                    <!-- Bibliografia -->
                    <section id="bibliografia">
                        <div class="card_descrizione">
                            <xsl:apply-templates select="//tei:back/tei:div/tei:listBibl" />
                        </div>
                    </section>
                </main>

                <!-- footer -->
                <footer id="riferimenti">
                    <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt" />
                </footer>
                <script src="dinamico.js" />
            </body>
        </html>
    </xsl:template>

    <!-- Templates -->

    <!-- Caratteristiche -->
    <!-- Template riferito alle info su FDS -->
    <xsl:template match="tei:listPerson">
        <h2> Le informazioni generali </h2>
        <h3>Autore</h3>
        <p>
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:value-of select="//tei:person[@xml:id='FDS']/tei:persName/tei:ref/@target" /> 
                </xsl:attribute>
                <xsl:attribute name="target">_blank</xsl:attribute>
                <xsl:value-of select="tei:msItem/tei:docAuthor"/>
            </xsl:element>
        </p>
        <h3>Data di nascita</h3>
        <p>Nato il <xsl:value-of select="//tei:person/tei:birth/tei:date" /> a <xsl:value-of select="//tei:person/tei:birth/tei:placeName/tei:settlement" />. </p>
        <h3>Data di morte</h3>
        <p>Morto il <xsl:value-of select="//tei:person/tei:death/tei:date" /> a <xsl:value-of select="//tei:person/tei:death/tei:placeName/tei:settlement" />.</p>
        <h3>Descrizione</h3>
        <p><xsl:value-of select="//tei:person/tei:note" /></p>
    </xsl:template>

    <!-- Template riferito alle info generali sull'opera -->
    <xsl:template match="tei:msContents">
        <h2>Caratteristiche</h2>
        <h3>Titolo</h3>
        <p><xsl:value-of select="tei:msItem/tei:title"/></p>
        <h3>Documento</h3>
        <p><xsl:value-of select="../tei:msIdentifier/tei:idno"/></p>
        <h3>Lingua</h3>
        <p><xsl:value-of select="//tei:textLang" />.</p>
        <h3>Acquisizione</h3>
        <p>
            Testi registrati nella
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:value-of select="../tei:msIdentifier/tei:repository/@ref"/> 
                </xsl:attribute>
                <xsl:attribute name="target">_blank</xsl:attribute>
                <xsl:value-of select="../tei:msIdentifier/tei:repository"/>
            </xsl:element>,
            <xsl:value-of select="../tei:msIdentifier/tei:country"/>.
        </p>
    </xsl:template>

    <!-- Descrizione fisica -->
    <xsl:template match="tei:physDesc">
        <h2>Descrizione</h2>
        <h3>Grandezza documento</h3> 
        <p>Il manoscritto si compone in: <xsl:apply-templates select="//tei:extent" /></p>
        <h3>Condizioni</h3>
        <p><xsl:value-of select="//tei:condition/tei:p" /></p>
        <h3>Disposizione pagine</h3> 
        <p><xsl:value-of select="//tei:layout/tei:p" />.</p>
        <h3>Interventi sul manoscritto</h3>
        <p><xsl:value-of select="//tei:handDesc/tei:p"/></p>
        <h3>Tipo di scrittura</h3> 
        <p><xsl:value-of select="//tei:typeDesc/tei:p" />.</p>
        <h3>Numero di identificazione</h3>
        <p><xsl:value-of select="//tei:idno" /></p>
    </xsl:template>

    <!-- Storia editoriale -->
    <xsl:template match="tei:history">
        <h2>Storia editoriale</h2>
        <p><xsl:value-of select="tei:origin"/></p>
    </xsl:template>

    <!-- Testo -->
    <xsl:template match="tei:ab">
        <xsl:element name="b">
            <xsl:attribute name="class">pericope</xsl:attribute>
            Pericope <xsl:value-of select="@n" />
        </xsl:element>
        <xsl:apply-templates/>
    </xsl:template>

    <!-- Template immagini e mappatura -->
    <xsl:template match="tei:facsimile">
        <h2>Le pagine originali</h2>
        <xsl:for-each select="tei:surface">
            <xsl:element name="img">
                <xsl:attribute name="class">immagini</xsl:attribute>
                <!-- Creo l'elemento immagine -->
                <xsl:attribute name="src"><xsl:value-of select="tei:graphic/@url"/></xsl:attribute>
                <!-- Creo l'attributo da applicare alla pagina -->
                <xsl:attribute name="usemap">#<xsl:value-of select="@xml:id"/></xsl:attribute>
                <xsl:attribute name="alt">foto</xsl:attribute>
            </xsl:element>
            <xsl:element name="map">
                <xsl:attribute name="name"><xsl:value-of select="@xml:id" /></xsl:attribute>
                <xsl:variable name="Width">
                    <xsl:value-of select="concat(substring-before(tei:graphic/@width, 'px'), '')"/> 
                    <!-- Rimozione di 'px' dalla stringa-->   
                </xsl:variable>          
                <xsl:variable name="ratio" select="400 div $Width"/> 
                <!-- Ratio = rapporto tra l’attuale dimensione della foto (500) e la dimensione della foto prima della sua scalatura -->
                <xsl:for-each select="tei:zone">
                    <xsl:element name="area">
                        <xsl:attribute name="shape">rect</xsl:attribute>
                        <xsl:attribute name="coords">
                            <xsl:value-of select="concat(@ulx*$ratio, ',', @uly*$ratio, ',', @lrx*$ratio, ',', @lry*$ratio)"/> 
                            <!-- Nuove coordinate aree adattate alle dimensioni della foto -->
                        </xsl:attribute>
                        <xsl:attribute name="id">
                            <xsl:value-of select="@xml:id"/>
                        </xsl:attribute>
                        <xsl:attribute name="href">##<xsl:value-of select="@xml:id"/></xsl:attribute>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <!-- Inizio riga -->
    <xsl:template match="tei:lb">
        <xsl:element name="br"></xsl:element>
        <xsl:element name="b">
            <xsl:attribute name="id">
                <xsl:value-of select="@facs"/>
            </xsl:attribute>
            <xsl:attribute name="class">numero</xsl:attribute>
            <xsl:value-of select="@n" />
        </xsl:element>
    </xsl:template>

    <!-- Appendice -->
    <xsl:template match="tei:list">
        <h2>Terminologia</h2>
        <xsl:for-each select="tei:label | tei:item">
            <br /> <br />
            <b><xsl:value-of select="tei:term[@xml:lang='it']"/></b>
            <xsl:element name="span" >
                <xsl:attribute name="class">gloss</xsl:attribute>
                <i><xsl:value-of select="tei:term[@xml:lang='fr']"/></i>
                <xsl:value-of select="tei:gloss" />
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <!-- Bibliografia -->
    <xsl:template match="tei:listBibl">
        <h2>Bibliografia</h2>
        <xsl:element name="ul">
            <xsl:for-each select="tei:bibl">
                    <xsl:element name="li">
                        <b><xsl:value-of select="tei:title"/></b>,
                        <xsl:for-each select="tei:author/tei:persName">
                            <i><xsl:value-of select="." /></i>,
                        </xsl:for-each>
                        <xsl:for-each select="tei:pubPlace/tei:placeName">
                        <xsl:value-of select="."/>,
                        </xsl:for-each>
                        <xsl:value-of select="tei:publisher"/>,
                        <xsl:value-of select="tei:date"/>
                    </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

    <!-- Edizione digitale -->
    <xsl:template match="tei:editionStmt">
        <h2>Riferimenti</h2>
        <h3><xsl:value-of select="tei:edition"/></h3>
        <xsl:for-each select="tei:respStmt">
            <div>
                <h3><xsl:value-of select="tei:resp"/></h3>
                <xsl:for-each select="tei:persName">
                    <p><xsl:value-of select="."/></p>
                </xsl:for-each>
            </div>
        </xsl:for-each>
    </xsl:template>

    <!-- Correzioni che comprendono: -->
    <!-- Abbreviazioni -->
    <xsl:template match="tei:abbr">
        <xsl:element name="span">
            <xsl:attribute name="class">abbr</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- Correzioni -->
    <xsl:template match="//tei:choice/tei:orig">
        <xsl:element name="span">
            <xsl:attribute name="class">orig</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="//tei:choice/tei:reg">
        <xsl:element name="span">
            <xsl:attribute name="class">reg</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!-- Espansioni -->
    <xsl:template match="tei:expan">
        <xsl:element name="span">
            <xsl:attribute name="class">expan</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- Aggiunte dell'autore -->
    <xsl:template match="tei:add">
        <xsl:element name="span">
            <xsl:attribute name="class">add</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- Cancellature -->
    <xsl:template match="tei:del">
        <xsl:element name="span">
            <xsl:attribute name="class">del</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- Elementi non leggibili -->
    <xsl:template match="tei:gap">
        <xsl:element name="span">
            <xsl:attribute name="class">del</xsl:attribute>? ?
        </xsl:element>
    </xsl:template>

    <!-- Terminologia -->
    <xsl:template match="tei:term">
        <xsl:element name="span">
            <xsl:element name="a">
                <xsl:attribute name="class">terms</xsl:attribute>
                <xsl:attribute name="href"><xsl:value-of select="@ref"/></xsl:attribute>
                <xsl:value-of select="."/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <!-- Glottonimi -->
    <xsl:template match="tei:lang">
        <xsl:element name="span">
            <xsl:attribute name="class">lang</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <!-- Toponimi -->
    <xsl:template match="tei:name[@type='place']">
        <xsl:element name="span">
            <xsl:attribute name="class">toponimo</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- Date -->
    <xsl:template match="tei:date">
        <xsl:element name="span">
            <xsl:attribute name="class">date</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- Enfasi -->
    <xsl:template match="tei:emph">
        <xsl:element name="u">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- highlighted items -->
    <xsl:template match="tei:hi[@rend='italic']">
        <xsl:element name="span">
            <xsl:element name="i">
                <xsl:value-of select="."/>
            </xsl:element>
        </xsl:element>
    </xsl:template>


</xsl:stylesheet>
