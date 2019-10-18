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
- Useful for our marketplace project: format
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



