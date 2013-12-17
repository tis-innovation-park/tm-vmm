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

# Generating Manuals

To generate manuals you simply enter the doc directory:

`cd doc`

and then type:

`make`

The generated documentation are stored in the generated-files directory.

## Requirements

To generate the manuals from the Markdown sources you need to install:

* pandoc 
* pdflatex

We provide a list of packages to install for some GNU/Linux
distributions:

### Debian based GNU/Linux distributions

`sudo apt-get install`
`sudo apt-get pandoc texlive-latex-base`

# Releasing

## Manual release

To release we go through the following procedure:

* Edit the version number in the configure script

`emacs -nw configure`

* Commit all your code and push it to github

`git commit -m <some comment>`

* configure and build 

`./configure --prefix /tmp && make clean all install`

* Verify the build

     * Check the version
       `/tmp/bin/tm-vmm --version`

     * Make sure all script are installed
       `/tmp/bin/tm-vmm --list-clients`

     * Make sure all pdfs are installed
       `ls -l /tmp/share/testingmachine/doc`

* Tag the code with the same version as you used in the configure script.

     `git commit -m <some comment>`

* Push the code and the tag
     `git push`
     `git push --tags`

* Build 

      `make dist`

* Upload ....

## Scripted release

We've written a script to help release a new version of Testing
Machine. Before you call it:

* Edit the version number in the configure script

`emacs -nw configure`

* Commit all your code and push it to github

`git commit -m <some comment>`

Now we're ready to call the script:

`./devel-stuff/bin/create-dist.sh --version <new-version>  --force-tag --push`

The scripts accepts some options:


* `--version <VERSION>` - Set the version number for the new release

* `--push` - Push the code (and tags) up to github

* `--force-tag` - If the tag already exists, overwrite it

