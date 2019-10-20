# Max's Notes

## Validations with Ruby

- The following commands will save the data in the database regardless of the validations.
  1. create
  2. create!
  5. update
  6. update!
- The following commands will not save the data if the validation has been triggered.
  1. save
  2. save!

### Setting up basic Validation on the model

- You do the validations in the models file.

```
class <modelName> < ApplicationRecord
  validates :<attribute>, presence: true
end
```
``` 
class Listing < ApplicationRecord
  belongs_to :breed
  validates :title, presence: true
```

- to test the above validation you can go to rails console and type the below
  - `rails c`
  - `Listing.create( title: nil ).valid?`
- How to inspect error messages and display error messages
  ```
  irb(main):006:0> listing = Listing.new( title:nil)
  => #<Listing id: nil, title: nil, description: nil, breed_id: nil, sex: nil, price: nil, deposit: nil, city: nil, state: nil, date_of_birth: nil, diet: nil, created_at: nil, updated_at: nil>
  irb(main):007:0> listing.valid?
  => false
  irb(main):008:0> listing.errors.messages
  => {:breed=>["must exist"], :title=>["can't be blank"]}
  irb(main):009:0>
  ```
  - The below creates a variable, then that variable equals to creating a new item in the database with an attribute of nil. This then asks if the data created is valid? and reports back false we then ask the system why its invalid and it returns back with error messages.

- How to see if there is a validation on a attribute
  - `Listing.create().errors[ :title ]`

- How to see if any errors have occurred in the system
  - `Listing.create.error.any?`

### Types of Validations: 

1. format validations
  - This allows you to set a regex on the expected format of your data. The below makes it so you can only enter 4 numbers and between numbers you've marked.
  - Look at Regex more as it is quite complicated.
  ```
  class Listing < ApplicationRecord
    validates :state, format: { with: /[1-9][0-9][0-9][0-9]/, message: "Only allows 4 numbers"}
  end
  ```

2. Inclusion Validations
  - The %w says take the string and break it up based on spaces and put it into an array.
  - The below says you have the state and if the user doesn't pick on of below states then it will spit back the error with their input message + is not valid state"
  ```
  class Listing < ApplicationRecord
    validates :state, inclusion: {in: %w(VIC NSW WA NT ACT QLD SA), message: "%{value} is not valid state"}
  end
  ```

3. Length Validation
  - The below is a validation of the length of a string  
  - The .. means its exclusive ... is inclusive 
  ```
  class Person < ApplicationRecord
    validates :name, length: {minimum: 2}
    validates :bio, length: {maximum: 500}
    validates :password, length: {in: 6..20}
    validates :registration_number, length: {is: 6}
  end
  ```
  ```
  class Listing < ApplicationRecord
    validates :postcode, length: {is: 4, wrong_length: "%{count} characters is the maximum allowed" }
  end
  ```

4. Numericality Validation
  - This checks if the input they have entered is a number
  - You can do tings such as :greater_than, :other_than, :odd, :even

  ```
  class Listing < ApplicationRecord
    validates :price, numericality: true 
    validates :age, numericality: {only_integer: true}
  end
  ```

5. Presence Validator
  - This basically just checks if the input/id is not blank.
  - Checks for white space, empty string or nil
  `validates :title, presence: true`

6. Uniqueness Validator
  - This validation checks with the database if the input is unique. For example this is used with mobile phones, emails etc..
  - The case_sensitive basically removes the case so it will search for everything regardless of the case.
  ```
  class User < ApplicationRecord
    validates :email, uniqueness: true
    validates :car_registration, uniqueness: {case_sensitive: false}
  end
  ```

7. Acceptance Validator
  - This method validates that a checkbox on the user interface was checked when a form was submitted. This is typically used when the user needs to agree to your application's terms of service, confirm that some text is read, or any similar concept.

  ```
  class Person < ApplicationRecord
    validates :terms_of_service, acceptance: true
  end
  ```
  ```
  class Person < ApplicationRecord
    validates :terms_of_service, acceptance: { accept: 'yes' }
    validates :eula, acceptance: { accept: ['TRUE', 'accepted'] }
  end
  ```

8. Confirmation Validator 
  - This checks if something matches. It can be used in a email form or password and checks if the input field matches the above input field. 
  - The below example is how it should be set up in your model and your view.

  ```
  class Person < ApplicationRecord
    validates :email, confirmation: true
  end
  ```
  ```
  <%= text_field :person, :email %>
  <%= text_field :person, :email_confirmation %>
  ```
  ```
  class Person < ApplicationRecord
    validates :email, confirmation: true
    validates :email_confirmation, presence: true
  end
  ```

### Using validator and if statements

  - You can associate the :if and :unless options with a symbol corresponding to the name of a method that will get called right before validation happens. This is the most commonly used option.
  - The below says only show the validator if they have 
  ```
  class Order < ApplicationRecord
    validates :card_number, presence: true, if: :paid_with_card?
  
    def paid_with_card?
      payment_type == "card"
    end
  end
  ```

### Displaying the errors onto the site

- To display errors you need to put the code in three places.

1. Models - Add your validations into the modals. See below 
  ```
  validates :title, :description, :sex, :price, :breed, presence: true # This is saying that we require all the fields to be entered
  validates :state, format: { with: /[1-9][0-9][0-9][0-9]/, message: "Only allows 4 numbers"}
  validates :state, inclusion: {in: %w(VIC NSW WA NT ACT QLD SA), message: "%{value} is not valid state"}
  ```
2. Controllers - You must then direct the page to handle errors. Basically the below is saying. If the listing is saved then redirect it to show the individual listing. Else if its not saving redirect it back to the save html page.  

  ```
  def create
    listing_params = params.require(:listing).permit(:title, :description, :breed_id, :sex, :price, :deposit, :city, :state, :date_of_birth, :diet)
    @listing = Listing.new(listing_params)

    if @listing.save
      redirect_to @listing
    else 
      render :new
    end
  end
  ```

3. Views - You then need to render the errors in your view. The below example is a form. This appears at the top of the form.
  - The `pluralize` basically says if there is one error change the word error to "error" if more than one error than make the word "errors"

  ```
  <% if listing.errors.any? %>
    <div>
      <h2><%= pluralize(@listing.errors.count, "error") %> Prohibited this article from being save: </h2>
      <ul>
        <% @listing.errors.full_messages.each do |msg| %>
        <li><%= msg %></li>
      <% end %>
      </ul>
    </div>
  <% end %>
  ```

# Mark's Notes

## Validations

- Best practice for validation in rails: add validations to the rails models we create.
- How to set up basic validation on a model: 
```
class Listing < ApplicationRecord
  belongs_to :breed
  enum sex: { female: 0, male: 1 }

  validates :title, presence: true
  #presence of true means it's not blank, not whitespace. So the title field has to be populated.
end
```
- In the console: `Listing.create(title: nil).valid?` Will return false, i.e. it's not valid.
- `listing = Listing.new(title: nil)`
- `listing.valid?`
- `listing.errors.messages`
- `listing = Listing.new(title: "test", breed_id: 1)`
- `listing.valid?`
- `listing.save`
- `Listing.create().errors[:title]` Will return "can't be blank"
- `Listing.create().errors[ :breed]` Will return "must exist"
- `Listing.create.errors.any?` If there are errors it will return "true"
- What kind of validations are there? On create and edit/update. 
- Useful for our marketplace project: format validations
```
class Listing < ApplicationRecord
  belongs_to :breed
  enum sex: { female: 0, male: 1 }

  validates :title, presence: true
  #presence of true means it's not blank, not whitespace. So the title field has to be populated.
  validates :state, format: { with: /[1-9][0-9][0-9][0-9]/, message: "only allows 4 numbers" }
end
```
- So if you want a particular format to a field (e.g. a phone number) you can specify how you want it. In the example above we're saying that the state field must be formatted with four numbers.
- Also useful for our marketplace project: inclusion validation:
```
class Listing < ApplicationRecord
  belongs_to :breed
  enum sex: { female: 0, male: 1 }

  validates :title, presence: true
  #presence of true means it's not blank, not whitespace. So the title field has to be populated.
  validates :state, inclusion: { in: %w(VIC NSW WA NT ACT QLD SA), message: "%{value} is not a valid state" }
end
```
- `listing = Listing.new(title: "A title", breed_id: 1, state: "NOT")`
- `listing.valid?`
- `listing.errors.messages`
- Should return: `=> {:state=>["NOT is not a valid state"]}`
- Another interesting validation: length
- Yet another kind of validation: numericality (checking the value range of numbers)
`validates :price, numericality: true` and so on...
- And the form of validation you'll probably use the most: PRESENCE
- `validates :title, :description, :sex, :price, :breed, presence: true`
- Last form of validation we're looking at today: UNIQUENESS
- `validates :email, uniqueness: true` That will check the email address and make sure that it's unique/is only in the database once.
- `validates :car_registration, uniqueness: { case_sensitive: false }` So if the registration is entered as 'TES' one time then 'tes' the next, it won't accept both.
- Acceptance validation for checkboxes (e.g. terms and conditions)
- https://edgeguides.rubyonrails.org/active_record_validations.html
- You can even create your own custom validation methods.
- allow_nil, allow_blank...

## Displaying Errors

- Scaffold will generate a lot of this for you. If you need an example, just check a scaffolded project you've created. 

- Putting validation directly in the _form partial (i.e. the view):
- `:autofocus` puts a flashing cursor in the input box?
- `:pattern` can put a RegEx specification after it.

