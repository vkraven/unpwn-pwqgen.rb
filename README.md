# unpwn-pwqgen.rb
Unpwn is an extension to iphoting's Ruby implementation of passwdqc's pwqgen.
It provides a hashed set of Troy Hunt's pwned passwords list, portable enough to be bundled with the pwqgen.rb gem.

Version: Unpwn-pwqgen.rb-0.01

##Description
It is ideal for a password generator to not, algorithmically, output a password already known to have been released in a leak, appeared in a password dictionary / wordlist, or otherwise pwned. At [Have I been pwned?](https://haveibeenpwned.com/Passwords), Troy Hunt has a list of 300+ million hashed vulnerable passwords, which extracts to about 12GB of data. Unpwn is a dataset of *all* the possible outputs to "pwqgen.rb 1" and "pwqgen.rb 2", and outputs to "pwqgen.rb" (default of 3) which is, so far, 100% accurate. See the proof section for the script used to assess the accuracy of the output.

As before, the data remains hashed in SHA1. Unpwn is intended to be small enough to be able to fit in a ruby gem. A script which checks outputs from pwqgen.rb against Unpwn data could be used to eliminate random outputs which just so happen to have already been pwned.

##Caution
Unpwn is written specifically for the pwqgen.rb project. Its output depends specifically on iphoting's pwqgen.rb code, the EFF wordslists used in pwqgen.rb and **not** the parent pwqgen project, and the Ruby libraries and interpreter. Although it might possibly be useful for other implementations of pwqgen, I have no proof that it will be complete for anything other than iphoting's pwqgen.rb.

##Note
I'm not proficient in Ruby, and I have a number of other priorities which keep me from devoting too much attention to it. The proof script is written in Python. Sorry =P

##Credits
Check out [iphoting's pwqgen.rb](https://github.com/iphoting/pwqgen.rb) upon which this project is based.
