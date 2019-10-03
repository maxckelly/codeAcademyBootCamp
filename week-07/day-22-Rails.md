## Day 22 - Mark's Notes

## How to implement nested resources: resolving the problem from yesterday

- First, look at routes.rb. Anything that is nested can only by viewed by looking at what it's nested in. E.g. in Roddy's example, comments was only available through the articles path e.g. `localhost:3000/articles/comments`

- At this point Roddy slacked a google doc with all the steps in the process. There were far too many to note down. Here is the doc:

https://drive.google.com/file/d/1l56gBCeh2xjw12oC9c_-eghHF6PyYGMB/view?usp=sharing


## After lunch

- What we're going to do now is use rails to create a static site from scratch.
- See View, ERB, and Partials notes in Canvas for the steps! It looks like it's a lesson about views, but it's actually all the steps you need to start building your own static site in rails.

- Create new rails project from the command line as usual then open up your text editor. 
- Go to routes.db `get "/", to: "pages#home", as: "root"`
- Go to controllers. Create new file: pages_controller.rb
- In pages_controller:
```
class PagesController < ApplicationController
	def home
		render html: "<h1>Hello</h1>".html_safe
	end 
end 
```
- Now create our views. Create a folder called pages.
- <% %> (won't display the return value from .erb)
- <%= %> (will display the return value from .erb)
- Again, too many steps to note down clearly. The step-by-step instructions are available in Canvas under View, ERB, and Partials.

## Anhar's lecture on creating a form with rails

- The point of this lecture was to start to show us how to build a form in rails so we won't have to rely on services like formspree.
- Again, too many steps to note down clearly. And the steps she went through didn't work because she set her project up incorrectly with some typos.
- The good news is, her source code is available here:
https://github.com/anharathoi/rails_class_demo_02_Oct_2019


## Afternoon exercise - convert your portfolio website into a rails static site

- We made a 30 min start on this
- Again, even though it's not clearly stated, the steps are all here: https://coderacademy.instructure.com/courses/240/pages/views-erb-and-partials?module_item_id=9574
- Just follow it from the top down