# Day 20 - Rails

- The below tag basically allows an image to be displayed in an text statement. The image tag allows the link to be into an image. 
- The if statement basically checks if the image tag is nil 
```
<% if(high_score.box_art_url) %>
  <td><%= image_tag(high_score.box_art_url, {height:45}) %></td>
<% end %>
```
- To remove an entire database you do `drop database "<dataBaseName>";` WARNING: You cannot get this back once deleted. 
- To drop a table you do `drop table "<tableName>";`

## Holders
- `rails generate migration add_<scaffoldName>_to_<dataBaseName> <scaffoldName>:reference`