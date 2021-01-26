User.destroy_all
u1 = User.create :email => 'mai@ga.co', :name => 'Mai', :nationality => 'Vietnamese', :dob => '1992-10-04', :about => 'This is Mai', :password => 'chicken', :admin => true
u2 = User.create :email => 'dom@ga.co', :name => 'Dom', :nationality => 'Australian', :dob => '1991-01-01', :about => 'This is Dom', :password => 'chicken'
u3 = User.create :email => 'lan@ga.co', :name => 'Lan', :nationality => 'Vietnamese', :dob => '1958-02-03', :about => 'This is Lan', :password => 'chicken'
puts "#{User.count} users created."

Comment.destroy_all
c1 = Comment.create :content => 'This recipe is a huge time saver!'
c2 = Comment.create :content => 'I tried and loved this recipe.'
c3 = Comment.create :content => "Oh it's too salty!"
puts "#{Comment.count} comments."

Country.destroy_all
o1 = Country.create :name => 'Vietnam'
o2 = Country.create :name => 'Japan'
o3 = Country.create :name => 'Korean'
puts "#{Country.count} countries."

Ingredient.destroy_all
i1 = Ingredient.create :name => 'Beef', :amount => '200', :unit => 'gram'
i2 = Ingredient.create :name => 'Pork', :amount => '100', :unit => 'gram'
i3 = Ingredient.create :name => 'Lettuce', :amount => '250', :unit => 'gram'
puts "#{Ingredient.count} ingredients."

Like.destroy_all
k1 = Like.create :liked => 'True'
k2 = Like.create :liked => 'False'

puts "#{Like.count} likes."

List.destroy_all
l1 = List.create :title => 'Favorites'
l2 = List.create :title => 'Everyday dishes'
l3 = List.create :title => 'Party specials'
puts "#{List.count} lists."

Rate.destroy_all
t1 = Rate.create :rating => '5'
t2 = Rate.create :rating => '4'
t3 = Rate.create :rating => '3'
puts "#{Rate.count} rates."

Recipe.destroy_all
r1 = Recipe.create :name => 'Pho', :prep_time => '7', :prep_time_unit => 'hours', :cooking_time => '120', :cooking_time_unit => 'minutes', :difficulty => '7', :course => 'Main', :serving => '4', :content => 'Step 1: Buy Pho, Step 2: Eat Pho'
r2 = Recipe.create :name => 'Sushi', :prep_time => '60', :prep_time_unit => 'minutes', :cooking_time => '30', :cooking_time_unit => 'minutes', :difficulty => '6', :course => 'Main', :serving => '4', :content => 'Step 1: Buy Sushi, Step 2: Eat Sushi'
r3 = Recipe.create :name => 'Fried Chicken', :prep_time => '120', :prep_time_unit => 'minutes', :cooking_time => '30', :cooking_time_unit => 'minutes', :difficulty => '6', :course => 'Main', :serving => '4', :content => 'Step 1: Go to the restaurant, Step 2: Eat Fried chicken'
puts "#{Recipe.count} recipes."

# Associations
puts "Comments and users."
u1.comments << c1
u2.comments << c2
u3.comments << c3

puts "Rates and users."
u1.rates << t1
u2.rates << t2
u3.rates << t3

puts "Likes and users."
u1.likes << k1
u2.likes << k2
u3.likes << k1

puts "Recipes and users."
u1.recipes << r1
u2.recipes << r2
u3.recipes << r3

puts "Lists and users."
u1.lists << l1 << l3
u2.lists << l2
# u3.lists << l3

puts "Comments and recipes."
r1.comments << c1
r2.comments << c2
r3.comments << c3

puts "Rates and recipes."
r1.rates << t1
r2.rates << t2
r3.rates << t3

puts "Likes and recipes."
r1.likes << k1
r2.likes << k2
r3.likes << k1

puts "Lists and recipes."
l1.recipes << r1 << r2
l2.recipes << r2 << r3
l3.recipes << r1 << r3

puts "Ingredients and recipes."
r1.ingredients << i1 << i3
r2.ingredients << i2 << i3
r3.ingredients << i1 << i3

puts "Country and recipes."
o1.recipes << r1
o2.recipes << r2
o3.recipes << r3
