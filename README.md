# Codifica Di Testi (2021/22)

Corso di Laurea triennale in <b>Informatica Umanistica</b>:

Il progetto contenuto in questo <i>repository</i> è stato realizzato per l'esame di <b>Codifica di Testi</b> con il professor <i>Angelo Mario Del Grosso</i> da <b>Alice Mannino</b> .

Il progetto è stato validato con Xerces con il seguente comando:

## Validazione con Xerces

```shell
$ java -cp "Xerces-J-bin.2.12.1/xerces-2_12_1/xml-apis.jar;Xerces-J-bin.2.12.1/xerces-2_12_1/xercesImpl.jar;Xerces-J-bin.2.12.1/xerces-2_12_1/xercesSamples.jar" dom.Counter -v codifica.xml
```

I file XML e XSL sono stati trasformati con Saxon-HE 10.3 in un file HTML "<i>codifica.html</i>" con il seguente comando:

## Trasformazione con il processore XSLT "Saxon"

```shell
$ java -jar ./SaxonHE10-3J/saxon-he-10.3.jar -s:codifica.xml -xsl:codifica.xsl -o:codifica.html
```
