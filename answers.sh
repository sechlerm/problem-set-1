
#! /usr/bin/env bash
#Problem Set 1 file


#example
datasets=$'/Users/marybethsechler/Desktop/GAW/data-sets'
#states=data-sets/states.tab.gz
#high_pop=$(gzcat $states | cut -f1,2 | sort -k2n | tail -n1 | cut -f1)

#echo $high_pop
#string manipulation to remove quotes. 
#tr= translate this to that
#sed 's/this/that/g'
#g is global, so applies to all
#Question 1 Which state in `states.tab.gz` has the lowest murder rate?

low_murder=$(gzcat $datasets/states.tab.gz | cut -f 1,6 | sort -k2n | grep -v ^"#Name" | head -n 1 |cut -f1 | sed 's/"//g')

echo 'answer-1 ' $low_murder #> answers.yml


# to continute writing to the same file, echo 'answer-2' >> answers.yml (>> is append!)


#Question 2 How many sequence records are in the `sample.fa` file?

seqnum=$(grep '>' $datasets/sample.fa | wc -l) 
echo 'answer-2 ' $seqnum

#Question 3 How many unique CpG IDs are in `cpg.bed.gz`?

cpgid=$(gzcat $datasets/cpg.bed.gz | cut -f4 | sort | uniq | wc -l)
echo 'answer-3 ' $cpgid

#Question 4 How many sequence records are in the `SP1.fq` file?
seqclust=$(grep '^@cluster' $datasets/SP1.fq | wc -l)
echo 'answer-4 ' $seqclust


## Question 5 How many words on are lines containing the word `bloody` in `hamlet.txt`? (Hint:use `wc` to count words).

hamlet=$(grep -i 'bloody' $datasets/hamlet.txt | wc -w)

echo 'answer-5 ' $hamlet




## Question 6 What is the length of the sequence in the first record of `sample.fa`? (Hint: use `wc` to count characters).

seqlength=$(grep -v '>' $datasets/sample.fa |head -n1 | tr -d '\n'| wc -c)
echo 'answer-6 ' $seqlength




## Question 7 What is the name of the longest gene in `genes.hg19.bed.gz`?

# 7 and 10 need to use awk. 

longgene=$(gzcat $datasets/genes.hg19.bed.gz | awk '{print $4, $3-$2}' | sort -k2n | tail -n1 | cut -f1 -d' ')
echo 'answer-7 ' $longgene

## Question 8 How many unique chromosomes are in `genes.hg19.bed.gz`?
uniquechrom=$(gzcat $datasets/genes.hg19.bed.gz | cut -f1 | uniq | wc -l)
echo 'answer-8 ' $uniquechrom


## Question 9 How many intervals are associated with CTCF in `peaks.chr22.bed.gz`?
CTCFint=$(gzcat $datasets/peaks.chr22.bed.gz | grep 'CTCF' | grep -v 'CTCFL' | wc -l)
echo 'answer-9 ' $CTCFint


## Question 10 On what chromosome is the largest interval in `lamina.bed`?
longchrom=$(cat $datasets/lamina.bed | awk '{print $1, $3-$2}'| sort -k2n | tail -n1 | cut -f1 -d' ')
echo 'answer-10 ' $longchrom

