# FinalProject
Final Project of the Coursera Data Science
Final Presentation Pitch - Which is the next word?
========================================================
author: A Risal
date: Dec 28, 2017
autosize: true

Predicting next word 
===================

Predict Next Word Application
The Algorithm: N-gram model and Back-off model

The goal of this exercise is to create a product to highlight the prediction algorithm that was built and to provide an interface that can be accessed by others. 

A Shiny app that takes as input a phrase (multiple words) in a text box input and outputs a prediction of the next word.


Description of the algorithm - steps taken
==============================================
1. Used as input - three disparate sources from news, blogs and tweets
2. Combined all sources and then broke each source into sentences
3. Converted all characters into lower characters.
4. Replaced all non-ascii characters, removed numbers, stripped empty spaces and removed unnecessary "stop words".
5. Calculated the most frequent 2 words, 3 words, 4 words and 5 words combination and sorted them. This is the classic N-gram algorithm using tm, Rweka and tidytext libraries.
5. Built basic 1-gram, 2-gram, 3-gram and 4-gram model by taking out the last word as a result word from the N-gram algorithm result. Printed to corresponding N-gram .csv files as N-gram dictionaries.
6. Designed a shiny application that quickly reads the N-gram dictionaries and produces result if input is 1, 2, 3 or 4 words. From any list of words, it uses "Back off" logic, which is, it tries matching last 4 words first, then 3 words, then 2 words and finally 1 word. If there is a match it shows the word. If not, it says so.

Application - location, instructions and functions 
========================================
1. Github depository for the code is here: 

https://github.com/anadirisal/FinalProject

2. Shiny Application is here:

https://anadirisal.shinyapps.io/final/

Please allow a few minutes for all the data to load up after you enter the words. Once loaded, the application is pretty responsive. There may be cases where no matches are found and an error will be thrown. 



Improvement Possibilities
=========================
1. Read more and diverse input files to increase the input sizes. Currently, the sorted files for 2-gram is 200MB, 3-gram is 100MB, 4-gram is 40MB and 5-gram is 28MB. 

2. Add a learning algorithm and enter those words that are currently not in the current N-gram dictionary.

3. Find more efficient way to store the dictionary so that it has a quick initial load. 




