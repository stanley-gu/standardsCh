READ ME
=======

Prerequisites
-------------
*  [LaTeX](http://www.latex-project.org/ftp.html) must be installed
*  [pandoc](http://johnmacfarlane.net/pandoc/) must be installed

How to build documents from source
----------------------------------
Source documents are written in pandoc markdown (file extension `.md`). The
`publish` script will automatically translate the markdown documents into a
number of formats (PDF, html, tex, docx, etc.). 

Simply run `./publish` from command line while in the main directory and the
folders containing the output documents will be automatically created.
