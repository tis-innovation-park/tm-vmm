# Using git

## Cloning

`git clone git://github.com/tis-innovation-park/vmm.git`

## Branch strategy

We don't have any branchinf strategy at the moment.

## Getting write access

If you have patches to the project please send them over, to the
community mailing list (community@).

If, after having sent some patches, you feel like you need write
access to the repository just contact us and ask.

# Fixing bugs and issues

When fixing a github issue mark the issue as closed by either:

* adding "closes issue #7" to your git commit message (where 7 is the
  issue resolved). When you push next time you will see the issue closed.

* Commit and push the fix and log in to github and mark the issue as closed.

# Discussions

If you need to ask question, need to raise an issue, discuss a bug or
simply say something nice, send an email to the mailing list
(community@).

Do you wish for another media (IRC, forum...) propose it on the
mailing list.

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




