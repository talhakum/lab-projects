# relative-evaluation-system


## Operating System Lab Projects 

### wc.sh

I am asked to build my own “wc” script that takes a text file as input and reports total number of letters, words and lines in this file. Your script should take two arguments. First one is filename. Second one is one of three letters “-h”, “-k” or “-s” which stand for numbers of letters, words and lines respectively. A sample run of this script is seen below.

$ sh mywc.sh myfile.txt –h

\> myfile.txt contains 105 letters.

### res.sh

A shell script that determines the total number of students who fail in a course by using RES(Relative Evaluation System) (e.g. Bağıl Değerlendirme Sistemi). In RES, a student has 3 marks: midterm, final and average (%50 of midterm, %50 of final). This data is to be read from “notlar.txt” of which some rows are given below.

1306850011	70	55 

1306850012	9	82 

1306850013	68	60 

…

First column is student ID, second column is midterm result and the third one is final result. Sample run for this script is like :
$ sh calculate.sh notlar.txt

\> 32 students failed in this course


 **There is also sample myfile.txt file for wc.sh and notlar.txt file for res.sh.**
