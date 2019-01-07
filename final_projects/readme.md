# Final Project Material

## Leaf identification (+0 score)

The goal is to propose a method for leaf identification based on the provided leaf attributes and using a proper unsupervised or supervised learning tool.
Material could be found in the leaf_project folder.

## Analysis of Svevo's Letter Corpus (+1 score)

A corpus of approximately 900 letters sent by and received to Italo Svevo, the famous writer from Trieste, is available below in this page. The letters are written in different languages (Italian, English, German, and Triestino, the dialect of Trieste); sometimes, more than one language is used in the same letter. The goal is to discover and report:

* which are the main topics of discussion in the corpus, who are the persons which each topic is more associated with, how does the interest on different topics evolve over the time
* which are the sentiments (positive, negative, at least) expressed in the letters, how are they related with persons and topics, how do they evolve over the time

The corpus is provided as a csv file. It contains info about: corpus section name, index of letter in the section, date of the letter,  year of the letter, sender of the letter, location of the sender, recipient, location of the recipient, languages used in the letter, main language, text of the letter. The corpus has already been [preliminary analyzed](http://www.museosveviano.it/ar/progetto/archivio-digitale/)

## Black Friday (+1 score)

The dataset in `BlackFriday.csv` file (in a zip file at the bottom of the page) is a sample of the transactions made in a retail store. The store wants to know better the customer purchase behaviour against different products.
Different learning problems can be settled with this dataset. Some problem examples are:

* finding different clusters of consumers within it.
* predicting the amount of purchase.
* predicting the category of goods bought.
* predicting the age of the consumer.

Focus on a specific problem and present a thorough and solid analysis (visualization tools are welcome both in exploration and communication of your results and reflections).

List of the variables:
`User_ID`; `Product_ID`;  `Gender Age` (Age in bins); `Occupation`; `City_Category`; `Stay_In_Current_City_Years`; `Marital_Status`; `Product_Category_1`; `Product_Category_2`; `Product_Category_3`; `Purchase` (Purchase amount in dollars).

## Citation Relevance (+2 score)

The goal is to build a tool which, given a research paper A citing a research paper B, gives an estimate of the relevance of the citation.
Intuitively, a citation is relevant if the content of paper B is in some way useful for understanding and/or putting in a context the content of paper A.

Useful links:

* [Valenzuela, Marco, Vu Ha, and Oren Etzioni. "Identifying meaningful citations." Workshops at the Twenty-Ninth AAAI Conference on Artificial Intelligence. 2015.](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0162364)

* [Microsoft Academic Knowledge API](https://labs.cognitive.microsoft.com/en-us/project-academic-knowledge)

* [dblp library](https://dblp.uni-trier.de/faq/13501473)