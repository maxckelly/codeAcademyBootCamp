# Mark's Notes


## Dynamic images (e.g. users uploading images)

- Install rails active storage: `rails active_storage:install`. Active record runs by default but not active storage. Need to install active storage. 
- The rails helper `file_field` is used to upload files
- Add `:picture` to our listing params.
- Add `has_one_attached :picture` to our Listing model.
- We use active storage because we don't want to store the image in the database
- It's a good rule to restart the server whenever you change something in the config. Even routes.
- How to display the file that we've stored?

- Where do we store our users' images? Amazon web services. IMPORTANT! Secure your data and never publish your keys. You may be liable for a bill from Amazon.
- What we're going to use in AWS: S3s EC2s. EC2 is your basic server. S3 is storage.


- development.rb `config.active_storage.service = :amazon`
- production.rb `config.active_storage.service = :amazon`
