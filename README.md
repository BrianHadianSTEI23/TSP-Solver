# Description
TSP Solver is a program that focuses on solving Traveling Salesman Problem with finite data
implementing dynamic programming as its basis of its solutions, running on Ruby Programming Language. Traveling Salesman Problem
states that for a given weighted graph with nodes representing cities and a starting point, give the salesman
the solution to visit all cities exactly once and get back to its hometown. Made in with lot of former syntax fault,
by Brian A. Hadian (13523048) as a challenge from a subject in campus IF2211 Algorithm Strategy. 

# How to run
Type these statement into your Windows terminal / bash
1. git clone https://github.com/BrianHadianSTEI23/TSP-Solver
2. cd src
3. ./main.rb
4. Your program has successfully ran

# How to add your own test case
1. Use below format.
A B C D ...  
0 1 9 8 ...  
1 0 2 5 ...  
9 2 0 4 ...  
8 5 4 0 ...  
. . . .  
. . . .  
> A B C D ... is your nodes  
> 0 1 9 8 ... is your edge weight
2. Insert it into .txt file
3. Put the file into src/test/input
4. Restart your program and your test file will be inserted in the next instantiation of program  

# Author
Brian A. Hadian (13523048)