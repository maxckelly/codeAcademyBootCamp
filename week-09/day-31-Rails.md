# Mark's Notes

## Bases tests

- There will be 9 questions on Thursday's test.

## Authentication

- Cookies is a form of authentication.
- JWT. Jason web token. Verified on the server side. JSON (javascript object notation).
- OAUTH. Outside authentication. Third party authentication. 
- Asymetric encryption. Public/private key encryption.

## Using devise in our rails project

- `bundle add devise`
- `rails generate devise:install`
- Then there are  some manual setup required:
- In config/development.rb - under the other action mailers: `config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }`
- Put these into the <body> of views/layouts/applications:
```
<p class="notice"><%= notice %></p>
<p class="alert"><%= alert %></p>
```
- `rails generate devise:views`
- `rails generate devise User`
- `rails db:migrate`
- We have now set up our devise. Time to add the code.
- In our Listings controller: `before_action :authenticate_user!`
- Now we need to attach our users to our listings
- Stop your server.
- Add devise user to our listings model: `rails generate migration AddUsertoListing user:references`
- If we did a rails db:migrate at this point we might get a bunch of errors (I didn't) due to null/not-null specifications
- In our user.rb model add: `has_many :listings`
- In our listing.rb model add: `belongs_to :user`
- If we try to create a new listing we will get a "User must exist" error message.
- So we need to put some code into our listings controller:
- In the create method add: `@listing = current_user.listings.create(listing_params)`
- Now add a link to a log out in our layouts/application.html.erb <%= link_to "logout", destroy_user_session_path, method: :delete %>
- Actually, add this instead:
```
	<% if user_signed_in? %>
		<%= link_to "logout", destroy_user_session_path, method: :delete %>
	<% else %>
		<%= link_to "login", new_user_session_path %>
	<% end %>
```

## Authorisation

- The probelm is, when we're logged in we can see every listing. We want to restrict access to the user's particular set of data.
- Create a `set_user_listing` in our listings controller
- In views index.html.erb add this: `<td><%= link_to "Edit", edit_listing_path(listing) if current_user.id == listing.user_id %></td>` That will remove the edit option from listings that do not belong to the particular user who is logged in.
- Do the same for the Destroy function.


## Agile

- The agile manifesto.
- Problem: documentation was swamping projects.
- Waterfall method of production: design => develop => test => deploy
- Problem with waterfall is that if you find a problem at the test phase you have to go all the way back to the design or develop phase.
- Agile is not scrum. Scrum is just a way of implementing agile in your project.
- Agile is about providing small chunks to your customer and getting feedback. The point is that you're constantly getting feedback.
- CI/CD (Continual integration, continual deployment). There are many tools available for CI/CD.
- Retrospective: can we improve? What worked? What didn't work?


## Marketplace assignment

- Design and build in small chunks
- Spend a lot of time at the start designing the project and thinking everything through. Will save you time later

