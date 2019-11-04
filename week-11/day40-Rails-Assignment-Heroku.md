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


## Assignment
1. Fixed a show issue that was being caused when the sitter and parent clicked show to see a meeting.
2. Created Heroku and pushed app.
3. Created payment table
4. Experimented with Stripe Connect