# Day 31 

## Authentication 

- Ways for authentication: 
  1. Cookies
  2. JWT - Json web token 
  3. OAUTH - Third party services
  4. ASYMMETRIC ENCRYPTION
  5. Devise

- We are going to use devise with Rails. To Set up auth do the below. NOTE: You should ideally set this up from the start. 
  1. `bundle add devise` - This adds the devise third party
  2. `rails generate devise:install` - This generates the devise 
  3. Copy `config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }`
  4. Go to `config/environments/development` and paste the above in around line 38
  5. Make sure you have defined a root url. This just makes sure that we have some page pointing to `root`
  6. Copy out the below examples 
  ```
    <p class="notice"><%= notice %></p>
    <p class="alert"><%= alert %></p>
  ```
  7. You then go to `app/views/layouts/application.html.erb` and paste the above in the `<body></body>` tag
  8. Copy `rails g devise:views` and paste to your command line in your terminal. - This will add a lot of files in views
  9. We now need to generate a user. We can use devise to generate a user model type `rails generate devise User`
  10. Go to the first controller the user will see and add `before_action :authenticate_user!` - This adds the basic login page. If you wanted to change where you sign in you can change where you place the controller. You add this at the top under the class
  11. We now need to at the user id to the model we want. In this example we're adding the user id to the model listing. `rails generate migration AddUserToListing user:references`
    - Note: you might get errors if you're running Rails 6.0, this is because you have data in it already. If you go to `db/migrate/add_user` and remove the check from the null value. This will allow nulls for the migration to occur and all the existing data will have some nulls.
  12. Go to `app/models/user.rb` and add the has_many like the below.
  ```
  class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
    has_many :listings
  end
  ```
  13. You then go to the table you have referenced and add `belongs_to :user`. Like the below.
  ```
  class Listing < ApplicationRecord
    belongs_to :breed
    enum sex: {female: 0, male: 1}

    # Validations 
    validates :title, :description, :sex, :price, :breed, presence: true # This is saying that we require all the fields to be entered
    # validates :state, format: { with: /[1-9][0-9][0-9][0-9]/, message: "Only allows 4 numbers" }
    validates :state, inclusion: { in: %w(VIC NSW WA NT ACT QLD SA), message: "%{value} is not valid state" }
    validates :deposit, numericality: { less_than_or_equal_to: :price, message: "can't be greater than price" } 
    has_one_attached :picture # This validates to see if the user has entered an image and if its just one image
    belongs_to :user
  end
  ```
  14. You can then create a user. Note: Make sure you're showing your errors in your forms so it can tell the user if they're not a user.
  16. You must then go and update your controllers where you're creating a new record. Add the below to your controllers where you're creating a new data and you have authentication set up - The important code is `@listing = current_user.listings.create( listing_params )` or we can do `@listing = current_user.listings.new(listing_params)`


  ```
    def create
    listing_params = params.require(:listing).permit(:title, :description, :breed_id, :sex, :price, :deposit, :city, :state, :date_of_birth, :diet, :picture)
    # @listing = Listing.new(listing_params)
    # This basically refers to the current user logged in. This is a devise thing.
    @listing = current_user.listings.create( listing_params )

    if @listing.save
      redirect_to @listing
    else 
      render :new
    end
  end
  ```

  17. Go to you `app/views/layouts/application.html.erb`. You then create an option to logout using: `<%= link_to "logout", destroy_user_session_path, method: :delete %>`. A better way to do this however is the below, the below is saying if the user is signed in display logout and if not display login.

  ```
  <% if user_signed_in? %>
      <%= link_to "logout", destroy_user_session_path, method: :delete%>
    <% else %>
      <%= link_to "login", new_user_session_path%>
  <% end %>
  ```

  ### Authorization 
  - This is saying what the user is allowed to do while they're logged in on the app.
  - There are a lot of ways you can do this. 
  - NOTE: The authorization and what the user sees etc is totally up to you.

  1. In your controller go to the private params and def a new method called `set_user_listing` - The below code is an example: The below is saying go to the user first then find the current listing by id. But if there is no listings for that particular user then redirect them back to listings
  ```
  def set_user_listing
    id = params[:id]
    @listing = current_user.listings.find_by_id(id)

    if @listing == nil
      redirect_to listings_path
    end
  end
  ```

  2. Then add another before_action at the top of your controller like this `before_action :set_user_listing, only: [ :edit, :update, :destroy]` and change the other before_action to `before_action :set_listing, only: [ :show ]`. This is basically saying edit, update and destroy can only be touched by logged in users.
  3. To restrict the view of what users see you can do the below in `views` and you can add `if current_user.id == listing.user_id`. An example of this is 
  ```
  <button>
    <%= link_to "Destroy", listing_path(@listing), method: :delete, data: {confirm: "Are you sure?"} if current_user.id == @listing.user_id %>
  </button>
  ```
  OR you can do the below 
  ```
  <button><%= link_to "Show", listing_path(listing) %></button>
  <% if current_user.id == listing.user_id %>
    <button><%= link_to "Edit", edit_listing_path(listing) %></button>
    <button><%= link_to "Destroy", listing_path(listing), method: :delete, data: {confirm: "Are you sure?"} %></button>
  <% end %>
  ```
  4. To only display the data/listings that the user has created you can do that in the controller and index method. 
  ```
  def index
    @listings = current_user.listings
  end
  ```


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
