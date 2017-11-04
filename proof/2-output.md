# Completion of Proof
## Output of parser.py
```
$	python -i parser.py
Parsing the 400 000 output from pwqgen.rb
Parsing successful.
Importing data used for the left side
Import successful. Now tallying number of entries in sample which falls in the refined left dataset
Left side analysis complete. Vkravens refinements for the left are 100.0% accurate.
Now clearing left data from memory.
Right dataset is too large to fit in my memory and swap space on python. Parsing it in six steps.
First right dataset
Right dataset 1 complete. Now importing dataset 2
Right dataset 2 complete. Now importing dataset 3
Right dataset 3 complete. Now importing dataset 4
Right dataset 4 complete. Now importing dataset 5
Right dataset 5 complete. Now importing final dataset
Vkravens refinements are :
Left:   100.0%
Right:  100.0%
Total:  100.0% accurate.
>>> len(baseright)
428799
>>> len(negright)
0
```
## Reasoning
**Proof: that the refined combinatorial datasets used in generating Unpwn accurately emulate actual output from pwqgen.rb**

Let the inputs used to create Unpwn be called 'unpwn-input-left' and 'unpwn-input-right', where a pwqgen.rb-like output is emulated by taking any one member of unpwn-input-left and concatenating it with any one member of unpwn-input-right. 
E.g. 'Aey+' is a member of unpwn-input-left, and 'Bee$cee' a member of unpwn-input-right.

1. 	If every legal result of calling "pwqgen.rb" (i.e. with the default of 3) is such that,
	split at the first seperator: 
	- the Left side == some x where x is a member of unpwn-input-left; and
	- the Right side == some x where x is a member of unpwn-input-right

	then Unpwn completely accurately emulates pwqgen.rb.

2.	If bash, Ruby, and Rubygems work as intended, then createsample.sh produces a large sample of legal pwqgen.rb outputs in "samplesize".

3.	If Python works as intended, then parser.py deterministically establishes that every entry in "samplesize" is either a legal result of "pwqgen.rb" that satisfies the antecedent of premise 1, or a legal result that does not satisfy the premise 1 antecedent.

4.	(From the output of parser.py) Every entry in samplesize is a legal result of pwqgen.rb that satisfies the antecedent in premise 1.

5.	(From 1-4) Unpwn completely accurately emulates pwqgen.rb for the randomly generated samplesize.

6.	(Induction) If samplesize is large enough, then it is reasonable to consider Unpwn a fully accurate emulation of pwqgen.rb.

7.	(Other Inductive Properties) If Unpwn does not completely accurately emulate pwqgen.rb for a randomly generated samplesize, but does so to a high degree of accuracy (e.g. 99.99%), Unpwn is still a reasonably reliable emulation of pwqgen.rb.

8.	(Assertion) Samplesize is large enough and the outcome of parser.py definitive enough.

**Therefore**, Unpwn is reasonably accurate in emulating pwqgen.rb, and can be reasonably relied upon to eliminate randomly-generated, but already pwned passwords during actual uses of pwqgen.rb.

## Comments

As noted, this is an extension proof of accuracy of the datasets used in generating Unpwn, and like any inductive system, requires you to take on faith premises 6, 7 and 8. I would have very much preferred to produce an intentional proof of accuracy (in other words, actually generating every possible output of pwqgen.rb, like I did for "pwqgen.rb 1" and "pwqgen.rb 2"), but I ran out of both memory and disk space for that. This is not to mention that it would have taken so much time to hash through them all on my system anyways. As a result of these pragmatic limitations, I used this limited and refined dataset to prepare Unpwn (even so, it took me a week of SLI hashing to produce!). I propose that this extensional proof is sufficient for practical purposes.

I welcome all comments and proposals for improvements.
