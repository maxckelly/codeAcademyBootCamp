# Assignment Work

1. I'm now passing through the `parent_user_id` through when creating an event. This required me to add to the model as well as alter the new and create method in the controller.
2. Made it so the meetings are displayed on the sitter index. This was done with changing the model like the below. 

```
Sitter Controller:
  # The below grabs the meetings as we have added a seperate foreign key for both the sitter and the parent.
  has_many :meetings, :class_name => 'Meeting', :foreign_key => 'sitter_user_id'
```
```
Parent Controller:
  # The below is saying that sitter_user belongs to Sitter controller and parent_user belongs to Parent controller.
  belongs_to :sitter_user, :class_name => 'Sitter'
  belongs_to :parent_user, :class_name => 'Parent'
```
3. Worked on readme