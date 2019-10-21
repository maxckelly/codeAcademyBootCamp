# Max's Notes

## Image Uploading

- Installing active storage - To install active storage you go to the terminal and type `rails active_storage:install` - This is where all the images will be stored.
- You then need to `rails db:migrate`

- To make it so the user can upload their own image you must do the following.
  1. You must first install active storage by typing `rails active_storage:install`
  2. You then `rails db:migrate`
  3. You first add the option for the user to add an image 
  ```
    <div>
      <%= form.label :picture%>
      <%= form.file_field :picture, accept: "image/png,image/gif,image/jpg,image/jpeg"%>
    </div>
  ```
  4. You then add the params into any of the methods in your controller like the below: - note
  ```
    listing_params = params.require(:listing).permit(:title, :description, :breed_id, :sex, :price, :deposit, :city, :state, :date_of_birth, :diet, :picture)
  ```
  ```
  def listing_params 
   params.require(:listing).permit(:title, :description, :breed_id, :sex, :price, :deposit, :city, :state, :date_of_birth, :diet, :picture)
  end
  ```
  5. We then added picture into our model using the below: NOTE - If you want more than one picture you do `has_many_attached :picture`
  ```
  has_one_attached :picture
  ```
  6. To then display the picture in the show you can type: This basically displays the picture and then the if statement says if the images is not attached don't produce an error
  ```
  <p>
    <%= image_tag @listing.picture if @listing.picture.attached? %>
  </p>
  ```
  7. NOTE: If you're using a wildcard on your routes (A wildcard is when you have a `*` in a get `get "*path", to: "pages#not_found"`). If you have this add the below:  
  ```
  get "*path", to: "pages#not_found", constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
  ```
## Amazon S3
  - You can't store data in GIT as GIT is meant for source code not data storage. So a familiar platform is AWS
  - You must never publish keys onto a platform like AWS

  1. Create an account 
  2. Go to services and go to Storage S3 Buckets
  3. Click create bucket
  4. You then must create a server DNS name - You can do this by creating a hash in your terminal this will make sure its secure and unique. To do this type `date | md5` in your terminal. To make it smaller you can do `date | md5 | head -c6 ;echo`
  5. You then press next and move onto the next stage
  6. You can leave this page all on default for now. 
  7. You then click next
  8. You then block all public access and click next
  9. Once you have reviewed the settings you go `create bucket`

  - You want to then create a login that has a limited scope on what they can do. To create that access do
    1. services in the top left 
    2. Then type `IAM` in search - This is your `identity and access management`
    3. You then click `users` on the left hand side and `add user`
    4. Type the user name in and then select `Programmatic access`
    5. Once you've clicked next you then click `attach existing policies`  
    6. Search for `s3` and select `s3FullAccess` - Note you can select more than one and different access
    7. You then click next to `tags` this page allows you to give access to particular servers if you have more than one server. NOTE: I left this blank.
    8. Then you click next and create user.
    9. You then are shown the access keys NOTE THIS ONLY APPEARS ONCE. You then need to encrypt it into Rails.
    10. You then store this key in the environment variable. In your terminal on the project folder type `EDITOR="code --wait" rails credentials:edit` this will then automatically open a file in your code editor (NOTE: Make sure `code .` is installed). Add the keys into the credentials and close the file. This should then say `New credentials encrypted and saved.`
    11. You then add aws s3 to your project. Type `bundle add aws-sdk-s3`
    12. Then go to the file `storage.yml` 
    13. You then uncomment the `amazon` section NOTE: spacing and everything is important in this file. You need to change two things here
      1. The region (change to sydney)
      2. Your bucket name. Yours should look like the below 
      ```
      amazon:
        service: S3
        access_key_id: <%= Rails.application.credentials.dig(:aws, :access_key_id) %>
        secret_access_key: <%= Rails.application.credentials.dig(:aws, :secret_access_key) %>
        region: ap-southeast-2
        bucket: snake-a8cb2a
      ``` 
    14. You then need to change where your storage is pointing. If you go to `environments` folder then in your development and production change `config.active_storage.service = :local` to `config.active_storage.service = :amazon`


