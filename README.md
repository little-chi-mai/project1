# Project#1: FoodHub

##By Mai Nguyen

[FoodHub](https://foodhub-project1.herokuapp.com) is my first official project I created within a project week at General Assembly and was deployed by `heroku`.

https://foodhub-project1.herokuapp.com

FoodHub is a web app that allows user to create their own account, post recipes and communicate with other users by commenting their posts. Users also can create their recipe lists of their choice.

This web app uses Ruby version 2.7.2 and Rails version 5.2.4.4. I have four models: `user`, `recipe`, `list` and `comment`.

`user` contains the information about `email`, `name`, `nationality`, `dob`, `about` and `image`.

`recipe` includes `name`, `prep_time`, `prep_time_unit`, `cooking_time`, `cooking_time_unit`, `difficulty`, `course`, `serving`, `content`, `image` and `user_id`.

`list` has only one column `title`.

`comment` contains `content`, `user_id` and `recipe_id`.

Their associations can be describe as:
- `user has_many comments` and `comment belongs_to user`.
- `user has many lists` and `list belongs_to user`.
- `user has_many recipes` and `recipe belongs_to user`.
- `recipe has_many comments` and `comment belongs_to recipe`
- `lists has_and_belong_to_many recipes`.

------
## Gem

`cloudinary` gem is used in this project to upload users' images to the web.

`bootstrap v4.6` is used as a framework to style the project's front end.

The app uses `bcrypt` gem to store the users' password that ensure the security.

----------
## Approach

Restriction users' ability with both front end and back end approach. Visitors without signing in can still view the page but cannot comment or view users information. Users onces signing in can only edit and delete their own recipes and comments.

Simple `search` function was added to search by recipes.

Suggestion feature that show related recipes to users when they view a recipe that increases the user engagement to the page.

Tests were run multiple times as a visitors, an user and admin to fix bugs and make sure the web is working probably.
