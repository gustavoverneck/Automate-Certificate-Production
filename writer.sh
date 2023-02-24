#! /bin/bash

# Adicione aqui as pessoas
LISTA_DE_NOMES=("Pessoa Um"
		"Pessoa Dois"
		"Pessoa Três")

IFS=""

# 1 - É preciso criar o documento template em odf, e extraí-lo numa pasta
# 2 - Altere content.xml para content-original.xml

for nome in ${LISTA_DE_NOMES[*]}; do
	cd template
	sed -e  "s/person_name/$nome/g" content-original.xml >> content.xml
	zip -r certificado_$nome.zip Configurations2 META-INF Pictures Thumbnails meta.xml mimetype settings.xml styles.xml content.xml
	mv certificado_$nome.zip certificado_$nome.odf
	rm /home/gverneck/codes/odf-writer/template/content.xml
	libreoffice --headless --convert-to pdf *.odf
	rm certificado_$nome.odf
done

# Por fim haverão arquivos com cada certificado em pdf

