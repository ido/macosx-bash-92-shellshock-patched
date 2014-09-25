Shellshock hotfix for Mac OS X 10.9 Mavericks
=============================================

This is the Apple Mac OS X 10.9 Mavericks bash-92 with 3.2.52 patch applied (shellshock fix).
This should work on most other versions of Mac OS X as well.

For more information about the original shellshock vulnerability, see:
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-6271

Note that this does (yet) not fix the follow-up CVE-2014-7169 vulnerability, see:
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-7169

So far, all this does is apply the 3.2.52 patch to bash-92 from Apple.  I will update this repository when a fix for CVE-2014-7169 is released as well, pull requests are welcome.  Hopefully Apple releases an official patch and this repository becomes irrelevant soon.

Prerequisites
=============

To build using the steps below, you'll need Xcode.

Usage
=====

```
  git clone https://github.com/ido/macosx-bash-92-shellshock-patched bash-92
  cd bash-92
  xcodebuild
  sudo mv build/Release/{bash,sh} /bin/
  bash --version
```

You should see the following output:

  GNU bash, version 3.2.52(1)-release (x86_64-apple-darwin13)

Don't trust me?
===============

If you want to do it yourself/not from this Git repository, you could wait for Apple to release a software update, or:

1.  Download the Mac OS X bash source from Apple here:

    http://opensource.apple.com/tarballs/bash/bash-92.tar.gz

2.  Then, download the patch from here:

    http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-052

3.  Then, verify the PGP signature with this file:

    http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-052.sig

4.  Then, apply the patch to the bash-3.2 folder in the tarball:

    ``tar xvzf bash-92.tar.gz && cd bash-92/bash-3.2 && patch -p1 < ../../bash32-052 && cd ../..``

5.  Then, build it as above with xcodebuild from the bash-92 folder.

    ``cd bash-92 && xcodebuild``

7.  Finally, move it into place:

    ``sudo mv build/Release/{bash,sh} /bin/``


Contribute
==========

Please feel free to submit pull requests.
