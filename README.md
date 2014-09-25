Shellshock hotfix for Mac OS X 10.9 Mavericks
=============================================

This is the Apple Mac OS X 10.9 Mavericks bash-92 with 3.2.52 patch applied (shellshock fix).
This should work on most other versions of Mac OS X as well.

For more information about the original shellshock vulnerability, see [CVE-2014-6271](http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-6271).

Note that this does not (yet) fix the follow-up vulnerability described in  [CVE-2014-7169](http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-7169).

For completeness, there is additional information about the vulnerability in [US-CERT Alert TA14-268A](https://www.us-cert.gov/ncas/alerts/TA14-268A) and [CERT Vulnerability Note VU#252743](http://www.kb.cert.org/vuls/id/252743).

I am waiting for the proposed patches for CVE-2014-7169 to pass review.  Those patches are 
[Chet Ramey's patch](http://www.openwall.com/lists/oss-security/2014/09/25/10) and [Florian Weimer's patch](http://www.openwall.com/lists/oss-security/2014/09/25/13).

So far, all this does is apply the 3.2.52 patch to bash-92 from Apple.  I will update this repository when a fix for CVE-2014-7169 is released as well, pull requests are welcome.  Hopefully Apple releases an official patch and this repository becomes irrelevant soon.

Usage
-----

You have four options, in descending order of how much you trust me (and increasing order of work):

*   Option 1: Use the PGP signed binaries in the latest GitHub release of this repository.
*   Option 2: Build the binaries from the patched source provided in this repository.
*   Option 3: Reproduce the work I have done in this repository from upstream sources.
*   Option 4: Wait for Apple to release an official software update.

Option 1: Use my PGP-signed binaries.
-------------------------------------

Do you trust me not to root your box?  If so:

1. Go to https://github.com/ido/macosx-bash-92-shellshock-patched/releases/
2. Once there, download the binaries (`bash` and `sh`) and the PGP signatures (`bash.asc` and `sh.asc`) in the release.
3. Verify the PGP signatures with `gpg --verify bash.asc` and `gpg --verify sh.asc`
4. Move the binaries into place with `sudo mv bash sh /bin/`
5. Verify that it worked with `bash --version`.  You should see the following output:
```
GNU bash, version 3.2.52(1)-release (x86_64-apple-darwin13)
```

Option 2: Build the patched binaries from this repository.
----------------------------------------------------------

You'll need Xcode for this.

```
  git clone https://github.com/ido/macosx-bash-92-shellshock-patched bash-92
  cd bash-92
  xcodebuild
  sudo mv build/Release/{bash,sh} /bin/
  bash --version
```
You should see the following output:
```
GNU bash, version 3.2.52(1)-release (x86_64-apple-darwin13)
```

Option 3: Don't trust me, trust upstream instead.
=================================================

Steps to reproduce my work from upstream...

You'll need Xcode for this.

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

Option 4: Wait for Apple to release an official software update.
----------------------------------------------------------------

You should apply Apple's software updates when they're released regardless of whether you apply this fix.


Contribute
----------

Please feel free to submit pull requests.

Disclaimer
----------

```
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
