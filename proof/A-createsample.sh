#!/bin/bash

counter=0
while [ $counter -le 2000000 ]
do
	pwqgen.rb >> samplesize
	((counter++))
done
