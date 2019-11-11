# Max's notes day 40
## Heroku 
1. Create a free account with Heroku 
2. https://devcenter.heroku.com/articles/heroku-cli#download-and-install - Download the Heroku CLI if you haven't already got this
3. in your project type `heroku login` and login 
4. Type `heroku create` into your terminal
5. Type `git push heroku master` - This pushes everything from your GIT Branch master to the heroku servers
6. We need to set an environment variable that allows us to set something in our environment variables. We use our environment variable to store our master key. To do this do the below
  1. `cat config/master.key` - This will spit back a bunch of random numbers which we will use as the key. We then need to assign the key to Heroku 
  2. Type `heroku config:set RAILS_MASTER_KEY=<pasteKey>`
7. `heroku run rake db:migrate` - This migrates your everything to heroku
8. `heroku run rake db:seed`
9. When you want to push changes to heroku you can run:
  - `git add .`
  - `git commit -m "message"`
  - `git push heroku master`
  - `heroku run db:migrate` to update database if needed.


## Assignment notes - Max
1. Fixed a show issue that was being caused when the sitter and parent clicked show to see a meeting.
2. Created Heroku and pushed app.
3. Created payment table
4. Experimented with Stripe Connect


# Mark's Notes 

## Deployment

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
 