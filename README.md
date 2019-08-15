# Docker image for pandoc

It is a Dockerfile to build a docker image which enable to generate a document with pandoc.

# Usage

Build a docker image.

```
$ docker build -t <IMAGE NAME> .
```

Generate a document with pandoc.
```
$ docker run -it -v $(pwd)/workspace:/workspace <IMAGE NAME> [pandoc command ...]
```

PDF
```
$ docker run -it -v $(pwd)/workspace:/workspace <IMAGE NAME> \
    pandoc -o sample.pdf \
	-N -f markdown+ignore_line_breaks+footnotes+definition_lists \
	-V mainfont=IPAexGothic \
	-V monofont=IPAexGothic \
	-V CJKmainfont=IPAexGothic \
	-V titlepage=true \
	-V toc-own-page=true \
	-F pandoc-crossref \
	--table-of-contents \
	--toc-depth=3 \
	--pdf-engine=xelatex \
	--template eisvogel \
	--highlight-style tango \
	sample.md
```

MS-Word
```
docker run -it -v $(pwd)/workspace:/workspace <IMAGE NAME> \
    pandoc -o sample.docx \
    sample.md
```

# History

| Rev. | Date | Description |
| ---- | ---- | ----------- |
| 1.0.0 | August 15, 2019 | Initial release. |
