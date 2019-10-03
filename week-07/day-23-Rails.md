## Day 23 - Mark's Notes

## Testing 

- Why do we test code? Some software may be tied to critical services (e.g. life support system). It can't fail! 
- Different places do testing differently.
- TDD - test driven development.
- Rach's learning resource for designing test cases: https://gist.github.com/burntsugar/f871e3173f3ff639ecd1d8b49b85f741
- Negative test case: see whether a method responds appropriately given bad data.
- Postive test case: see whether a method responds appropriately given good data.
- Negative test cases are probably more important. E.g. a negative bank balance and a withdrawl request of $1,000,000. Make sure it fails.
- Rach's learning resource for rspec: https://gist.github.com/burntsugar/b609ec07cd4ddd6c87bbb0270226665b
- Create one rspec file for each ruby file you test.
- There is a naming convention: if testing `code.rb` name your test file `code_spec.rb`
- rspec.info for the documentation
- rspec challenge: https://gist.github.com/burntsugar/24d11ca7ffce330f372d42adf36a1ddd

## Tying up loose ends in Rails

- Yesterday's lecture on nesting and the solution in demonstrated was probably too convoluted. There's another way to do it.
- Here's Roddy's revised notes on how to deal with nesting: https://docs.google.com/document/d/1Wr1XnTnO50ZQq1VPh5sc68eD-duZGRJIW8qfwgBP2Ew/edit

## Afternoon lecture on Git/Git Hub

- Rails automatically initializes git. So if you try `git init` it will say it's reinitializing
- Avoid large revisions. Commits should have a purpose AND be small. You don't want to be committing 500 new lines of code.