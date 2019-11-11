# Worked on Assignment all day - Max
## Below is what I worked on with my assignment.

1. Made my navbar smart. Added if statements to my navbar so the user is directed to the correct location based on their role.
```
<!-- If User is signed in as parent they see the below. -->
<% if user_signed_in? && current_user.role_id == 1 %>
  <nav class="navbar">
    <div class="links">
      <div class="profile-image-container"></div>
      <%= link_to "Home", parents_home_path(), class: "navbar-link" %>
      <%= link_to "All meeting", meetings_path(), class: "navbar-link" %>
      <% if user_signed_in? %>
        <%= link_to "logout", destroy_user_session_path, method: :delete, class: "navbar-link"%></p>
      <% else %>
        <%= link_to "login", new_user_session_path, class: "navbar-link"%>
      <% end %>
    </div>
  </nav>
  <!-- If user is signed in as sitter they see the below -->
  <% elsif user_signed_in? && current_user.role_id == 2 %>
    <nav class="navbar">
      <div class="links">
        <div class="profile-image-container"></div>
        <%= link_to "Home", sitters_home_path(), class: "navbar-link" %>
        <%= link_to "All meeting", meetings_path(), class: "navbar-link" %>
        <% if user_signed_in? %>
          <%= link_to "logout", destroy_user_session_path, method: :delete, class: "navbar-link"%></p>
        <% else %>
          <%= link_to "login", new_user_session_path, class: "navbar-link"%>
        <% end %>
      </div>
    </nav>
    <!-- If user isn't signed in they see the below -->
  <% else user_signed_in? %>
    <nav class="navbar">
      <div class="links">
        <div class="profile-image-container"></div>
        <%= link_to "Home", root_path(), class: "navbar-link" %>
        <% if user_signed_in? %>
          <%= link_to "logout", destroy_user_session_path, method: :delete, class: "navbar-link"%></p>
        <% else %>
          <%= link_to "login", new_user_session_path, class: "navbar-link"%>
        <% end %>
      </div>
    </nav>
<% end %>
```

2. Added AWS active storage and images to Navbar
3. Changed the relationship with parents and sitters to be a one-to-one relationship with Users. This required me to change the create method and the id params slightly. 
4. Added images to the navbar and if image isn't assigned then it displays default image. 
