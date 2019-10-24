# Max's Notes

### Stripe 

1. Go to your profile and add `bundle add stripe`
2. Create a Stripe account
3. Go to the developers tab and get your API Key 
4. Type in `EDITOR="code --wait" rails credentials:edit`
5. Input your keys in the credentials like the below 
  ```
  stripe:
    public_key: <keyEnter>
    secret_key: <keyEnter>
  ```
6. Go to `config/initializers` create a new file `stripe.rb`
7. Put this into the file `Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)` NOTE: Make sure you restart your server after this.
8. Go to the controller where you want the checkout functionality - In this case its `listings` and the `show` method.
9. You will then enter the below code in.
  ```
  def show
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
        name: @listing.title,
        description: @listing.description,
        # We're timesing by 100 because stripe works in cents and we want to display dollars
        amount: @listing.deposit * 100, 
        currency: 'aud',
        # Quantity is the amount you're buying if you're selling based on quantity.
        quantity: 1
      }],
      payment_intent_data: {
        metadata: {
          user_id: current_user.id,
          # The below grabs the listing ID so it relates to the listing
          listing_id: @listing.id
        }
      },
      # This directs the user if the payment is successful 
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@listing.id}",
      cancel_url: "#{root_url}listings"
    )

    # This then sets the session above to an id.
    @session_id = session.id
  end
  ```
  - If you can also 
10. We now want to adjust the views go to: `views/listing/show.html.erb` - Note this is where ever you added the stripe methods in.
11. Add a button to `show.html.erb` - Note this is where ever you added the stripe methods in.
  - Number to currency is just saying display the number in a currency way that is then linked to the method.
  ```
  <button>Pay Deposit <%= number_to_currency( @listing.deposit ) %></button>
  ```
12. You want to go back to your `show.html.erb` and REPLACE `<button>Pay Deposit <%= number_to_currency( @listing.deposit ) %></button>` with the below code, which is JavaScript. The below javaScript basically says when the button has been clicked then go to the 
  ```
  <button data-stripe="payment">
  Pay Deposit <%= number_to_currency(@listing.deposit) %>
  </button>

  <script src="https://js.stripe.com/v3/"></script>

  <script>
    document
      .querySelector("[data-stripe='payment']")
      .addEventListener("click", () => {
        const stripe = Stripe(
          "<%= Rails.application.credentials.dig(:stripe, :public_key) %>"
        );

        stripe.redirectToCheckout({
          sessionId: "<%= @session_id %>"
        });
      });
  </script>
  ```

13. You then add the route into your `routes.rb` file 

  ```
  # Stripe/Payments Routes
  get "/payments/success", to: "payments#success"
  ```
14. You then create a new file in your `controller` folder called `payments_controller.rb`. Enter the below into your controller.

  ```
  class PaymentsController < ApplicationController

    def success

    end  
  end
  ```
15. You then create a new folder called `payments` in `app/views`. So your file system will be `app/views/payments`.
16. You then create a new file in `app/views/payments` called `success.rb`. I put the below code in. This page is when the user has made a successful payment

  ```
  <h1> Success </h1>

  <%= link_to "Go to listings", listings_path%>
  ```
17. Seeing you're testing on localhost you need to be able to test it through the web. THIS STEP IS ONLY FOR LOCAL HOST.
  - Go to http://www.ultrahook.com/register
  - Register here and create an web hook. This can be any name. 
  - Run the commands `echo "api_key: TlAYXOSEYKOj7s66iI1z0Y0HhMyZV92x" > ~/.ultrahook`
  - Then install the ultrahook gem `gem install ultrahook`
  - Once that has been installed run `ultrahook stripe 3000` in the terminal - This produces a http which you will need to copy.
  - `http://stripe.snakemarketplaceapp.ultrahook.com -> http://localhost:3000` - This is the URL Ultrahook gives back.
  - We need to go to Stripe >> Developers >> Webhooks >> Add endpoint >> Then in the https input add the below http. Once that is added select `checkout.session.completed` in the event types.
   ```
    https://stripe.snakemarketplaceapp.ultrahook.com/payments/webhook
   ```
  - You then need to disable auth while you're using localhost. To do this go to `payments_controller.rb`
  - Type the below 

  ```
  class PaymentsController < ApplicationController
    # While we're in the testing environment we're going to skip auth.
    skip_before_action :verify_authenticity_token, only: ( :webhook )
    def success

    end

    def webhook 
      p params
    end

  end
  ```
18. You also need to add a post in your `routes.rb`. Add - `post "payments/webhook", to: "payments#webhook"` under your `get`
19. Once that has been completed you then need to hook the Ultrahook up to your localhost. To do this do the below.
  - In your terminal run `ultrahook stripe 3000`
  - It will auth and then load. Once its stopped writing press `ctrl-z`
  - Once its stopped writing type `bg 1`
  - After that has appeared type `rails s` this will then start your rails server and you're ready to test if payments are successful.
  - NOTE: To stop ultrahook and rails s first do `ctrl-c` (this stops rails s) then type `fg 1` this brings up ultrahook and then press `ctrl-c`
  - See below for terminal log.

  ```
    Maxs-MacBook-Pro-2:snake_marketplace mkelly$ ultrahook stripe 3000
    Authenticated as snakemarketplaceapp
    Forwarding activated...
    http://stripe.snakemarketplaceapp.ultrahook.com -> http://localhost:3000
    ^Z
    [1]+  Stopped                 ultrahook stripe 3000
    Maxs-MacBook-Pro-2:snake_marketplace mkelly$ bg 1
    [1]+ ultrahook stripe 3000 &
    Maxs-MacBook-Pro-2:snake_marketplace mkelly$ rails s
    => Booting Puma
    => Rails 5.2.3 application starting in development
    => Run `rails server -h` for more startup options
    Puma starting in single mode...
    * Version 3.12.1 (ruby 2.5.1-p57), codename: Llamas in Pajamas
    * Min threads: 5, max threads: 5
    * Environment: development
    * Listening on tcp://localhost:3000
    Use Ctrl-C to stop
  ```
20. We then add our params to our webhook. Do the below. The below code is saying collect the data that happened from Stripe and return it to us. We're returning the metadata which we defined in `listings_controller.rb` and in the `show.html.erb` method. The status 200 is for Stripe and it says basically says confirm that the payment was successful, everything above the status 200 is for us and the data we're getting back. While the `status 200` is for Stripe and needed. 

  ```
  def webhook 
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)


    # This is getting the metadata that we have in listings_controller.rb and the show method.
    listing_id = payment.metadata.listing_id
    user_id = payment.metadata.user_id

    p "listing id = " + listing_id
    p "user id = " + user_id
    
    status 200
  end
  ```
21. To display information from the payment isn't from accessing the information from the Stripe account its grabbing the information from our database. An example of how the information is displayed is below.

  `payments_controller.rb` - Here we have defined params as private and assigned them in a before_action

  ```
  def set_listing
    listing_id = params[:listingId]
    @listing = Listing.find(listing_id)
  end
  ```
  ```
  before_action :set_listing, only: [:success]
    def success
  end
  ```

  - You can then post in the views controller and access the information like the below: 

  ```
  <h1> <%= "Success! Thank you #{current_user.email} for payment" %></h1>

  <div>
    <p><%= @listing.title %></p>
    <p><%= @listing.deposit %></p>
    <p> <%= "The total payment of #{@listing.price} is due in the next 30 Days" %></p>
  </div>
  ```