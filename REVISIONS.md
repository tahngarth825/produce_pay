# Revisions
Obviously this was done under time constraints that may have forced you down a path or pattern that ended up with some code that is non ideal.

## Questions

1. Are there any sections that you would have done differently with hindsight?
2. Anything that you'd like to refactor given more time?

## Answers
* I would have liked to format the printed output matrix nicer.
* I would have liked to notate the classes and methods more thoroughly.
* I totally forgot to continuously commit my changes. I'm used to committing during work, but I'm not used to committing code while scripting. I also normally commit after I run specs and they pass, but this assignment didn't have us create specs, so since I normally commit after running specs, I missed that part.
* I actually had a lot of trouble figuring out how to switch to my personal Github account to push since I ran this from my work laptop. I did eventually get it working, but it wasted some time.
* I was originally going to just do a simple matrix of numbers and nils, but it seemed better to have each cell be an instance of a class to handle aging it better. This ended up giving issues though because it made it harder to deep dup the matrix. I basically had the issue where I was accidentally aging each cell individually instead of staging the aging stuff to happen all at once. This mattered because the neighbors were changing when they shouldn't have yet. If it were just a matrix of values, then it would have been easier to deep dup the matrix. I did eventually figure out the proper way to do it, though, so I think the solution I did figure out was the "proper" solution in terms of isolating logic to classes.
* I feel like there might be a more elegant way to get the neighbors compared to what I did, but I'm not sure what it would be at the moment
* I totally didn't understand the part of the prompt where it says that if a cell is empty and it has "Exactly 2 adult neighbors", then to create a new child. I thought it meant "if there are exactly two neighbors, and both of those are adults", but it didn't mean that. It meant "if there are exactly two adult neighbors, but any number of child, senior, or empty neighbors". This threw me off and I struggled with trying to figure out what I was doing wrong.
