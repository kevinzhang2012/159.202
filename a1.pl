%Part1
output:-
writeln('----159.202 Assignment 1----'),
writeln('ID: 13158665, Name: Yuxiang Zhang.'),
writeln('ID: 12228309, Name: Gary Zhang.'),
writeln('----All 4 parts solved----').

%======================================
%Part2

likes(tom,jerry).
likes(mary,john).
likes(mary,mary).
likes(tom,mouse).
likes(jerry,jerry).
likes(jerry, cheese).
likes(mary,fruit).
likes(john,book).
likes(mary,book).
likes(tom,john). 

% i)
likes(john, X) :- likes(mary,X).
likes(john, X) :- likes(X, cheese).

% ii)
% ?- likes(mary,X).
% ?- likes(john,X).
% ? -likes(X,book).

%======================================
%Part3

% Some Greek gods
male(apollo).
male(ares).
male(cronus).
male(coeus).
male(hades).
male(hephaestus).
male(oceanus).
male(poseidon).
male(uranus).
male(zeus).

% Some Greek goddesses
female(aphrodite).
female(artemis).
female(demeter).
female(gaea).
female(hera).
female(hestia).
female(leto).
female(phoebe).
female(rhea).

%parents(person, father, mother)
parents(apollo, zeus,leto).
parents(cronus,uranus,gaea).
parents(coeus, uranus, gaea).
parents(ares, zeus,hera).
parents(phoebe, uranus, gaea).
parents(hestia,cronus,rhea).
parents(poseidon,cronus,rhea).
parents(hades,cronus,rhea).
parents(zeus,cronus,rhea).
parents(demeter,cronus,rhea).
parents(oceanus, uranus, gaea).
parents(hebe, zeus,hera).
parents(hephaestus, zeus,hera).
parents(artemis, zeus,leto).
parents(rhea, uranus,gaea).

brother(Person1, Person2):- male(Person1),
 parents(Person1, Father, Mother),
 parents(Person2, Father, Mother), Person1 \= Person2.

% i)
sister(Person1, Person2):- female(Person1),
 parents(Person1, Father, Mother),
 parents(Person2, Father, Mother), Person1 \= Person2.

aunt(Person,Aunt):- female(Aunt),
 parents(Person,Father,Mother),
 (sister(Aunt,Father); sister(Aunt, Mother)).

son(Person,Father):- male(Person), female(Mother),
 parents(Person,Father,Mother).

% ii)
% a) Apollo's aunts: demeter, hestia
% b) Zeus' sons: apollo, ares, hephaestus

%======================================
%Part4

% i)
woman(anna).
woman(eve).
woman(julie).
woman(carmela).

man(luc).
man(max).
man(marc).
man(hector).

hair(anna,blonde).
hair(eve,brunette).
hair(julie,red-hair).
hair(carmela,blonde).

height(eve,155).
height(julie,165).
height(carmela,159).
height(luc,170).
height(marc,190).

% ii)
petite(Person):- Person=anna;
                 height(Person,Height),
                 Height<160.

prefers(luc,Female) :-   woman(Female),
                         hair(Female, red-hair).

prefers(marc,Female):-   woman(Female),
                         hair(Female, brunette).

prefers(max,Female) :-   woman(Female),
                         petite(Female),
                         hair(Female, brunette).

prefers(hector,Female):- woman(Female),
                         petite(Female),
                         hair(Female, blonde).

prefers(anna,Male) :-    man(Male).

%Eve prefers man who prefers her.
prefers(eve,Male) :-     man(Male),
		         prefers(Male,eve).

%Julie prefers man taller than her.
prefers(julie,Male) :-   man(Male),
                         height(Male,Height1),
                         height(julie,Height2),
                         Height1 > Height2.

prefers(carmela,Male) :- man(Male).

% iii)
match(Male, Female) :- man(Male),
                       woman(Female),
		       prefers(Male, Female),
                       prefers(Female, Male).
							  
% iv)
% ?- match(Male, Female).
% Male = luc,
% Female = julie ;
% Male = max,
% Female = eve ;
% Male = marc,
% Female = eve ;
% Male = hector,
% Female = anna ;
% Male = hector,
% Female = carmela.
