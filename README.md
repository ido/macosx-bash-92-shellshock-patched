Shellshock hotfix for Mac OS X 10.9 Mavericks
=============================================

Apple Mac OS X 10.9 Mavericks bash-92 with 3.2.52 patch applied (shellshock fix)

For more information about the original shellshock vulnerability, see:
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-6271

Note that this does (yet) not fix the follow-up CVE-2014-7169 vulnerability, see:
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-7169

All I've done is apply the 3.2.52 patch to bash-92 from Apple.  Specifically:

Usage
=====

  git clone https://github.com/ido/macosx-bash-92-shellshock-patched bash-92
  cd bash-92
  xcodebuild
  sudo mv build/Release/{bash,sh} /bin/
  bash --version

You should see the following output:

  GNU bash, version 3.2.52(1)-release (x86_64-apple-darwin13)

Don't trust me?
===============

If you want to do it yourself/not from this Git repository, you can
download the Mac OS X bash source from Apple here:

http://opensource.apple.com/tarballs/bash/bash-92.tar.gz

Then, download the patch from here:
http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-052

Then, verify the PGP signature with this file:
http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-052.sig

Then, apply the patch to the bash-3.2 folder in the tarball.
Then, build it as above with xcodebuild from the bash-92 folder.

