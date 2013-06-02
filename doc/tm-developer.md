# Using git

## Cloning

## Branch strategy

## Getting write access

# Fixing bugs and issues

# Writing documentation

All documentation is written in Markdown format. We use pandoc to
generate html and pdf.

Each chapter/section is written in separate files to make them more
easily re-usable. Since there's no *include* functionality in Markdown
we had use the Makefile to cp/cat together the various
manuals. Perhaps not the most optimal way of doing things - but it
works. If you have improvement suggestion you're more than welcome.

# Generating Manuals


## Requirements

To generate the manuals from the Markdown sources you need to install:

* pandoc 
* pdflatex

We provide a list of packages to install for some GNU/Linux
distributions:

### Debian based GNU/Linux distributions

`sudo apt-get install`
`sudo apt-get pandoc texlive-latex-base`




