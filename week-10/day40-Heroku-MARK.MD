# Deployment

- Week 1, Term 2 of Canvas there are instructions for Heroku. ("The Rails Intro")
- https://devcenter.heroku.com/articles/heroku-cli#download-and-install
- Install Heroku using homebrew `brew tap heroku/brew && brew install heroku`
- `heroku autocomplete`
- cd into project
- `heroku login`
- `heroku create`
- You will see, e.g.:
```
Creating app... done, ⬢ vast-sea-28738
https://vast-sea-28738.herokuapp.com/ | https://git.heroku.com/vast-sea-28738.git
```
- `git push heroku master`
- Info on heroku command line: https://devcenter.heroku.com/articles/heroku-cli#download-and-install
- Need to set our master key. Can use the Heroku command line to do it
- `heroku config:set RAILS_MASTER_KEY=` then enter your master key.
- Master key is visible by typing: `cat config/master.key`
- Cannot deploy a sql lite rails app to heroku
- Then: `heroku run rake db:migrate`
- If you want to seed: `heroku run rake db:seed`
 
