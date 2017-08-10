#Generates a random menu based on three categories: adjectives, cooking-styles and type of food. Menu does in no way guarantee delicious combinations and should be reviewed before using in a restuarant that has the goal of making money.  User will have the option of using a pre-set menu or designing their own menus.

puts "Welcome to the random menu generator! You will have the option to choose your own menu options or use a pre-set menu. You will also have the option of choosing how many menu items you would like to have on your menu. Enjoy!"

#Creates the menu_options array (which will hold the adjectives array, the cooking-styles array and the types of food array) and allows user to choose a pre-set menu or to create their own menuy. If user fails to follow directions properly makes an unavailable choice they lose the privelege to choose and are given a pre-set menu.
menu_options = []
puts
puts "Choose an option:"
puts "\t(A) Create my own menu "
puts "\t(B) Use a pre-set menu "

 print "> "

 choice = gets.chomp.upcase
puts

# If the user chooses to make their own menu they are asked to enter their own adjectives, cooking_styles and foods. They are first asked how many of each they would like to enter.
if choice == "A"

  lists = ["adjectives", "cooking styles", "foods"]

  list_counter = 0

  3.times do |list|
    print "How many #{lists[list_counter]} would you like to include? "
    num_items = gets.chomp.to_i

    puts "\nEnter #{num_items} #{lists[list_counter]}. Press RETURN after each"
    temp_array = []

    num_items.times do |n|
      print "#{n + 1}. "
      entry = gets.chomp
      temp_array.push(entry)
    end
    menu_options.push(temp_array)
    list_counter += 1
    puts
  end
# If user chooses pre-set menu, the menu_options are chosen by Shaunna
else
    menu_options = [
      %w[hot cold fresh chilled crispy crunchy seasoned burnt charred creamy],
      %w[baked seared roasted boiled grilled blended toasted broiled steamed sauteed],
      %w[salmon burgers lettuce watermelon peppers cheese chicken tofu pasta chestnuts]
    ]
end

#The maximum number of items the menu is determined from the menu options based on the shortest list of adjectives, cooking_styles or foods.
max_items = menu_options.min_by(&:length).length

#User is asked how many menu items they would like printed
print "\nHow many menu items would you like to see?  "
num_items = gets.chomp

#If the user enters a nonsensical answer or a number outside the range of 10 they are asked again until they answer a
while num_items.to_i.to_s != num_items || num_items.to_i > max_items || num_items.to_i < 0
  print "Please enter a whole number between 1 and #{max_items}: "
  num_items = gets.chomp
end

#Shuffles the arrays to randomize the menu
menu_options.each { |food_array| food_array.shuffle! }

#Prints the menu options
puts "\nMENU:"
puts "-"*42
i = 0
num_items.to_i.times do
  puts "  #{i+1}. #{menu_options[0][i]} #{menu_options[1][i]} #{menu_options[2][i]}"

  i += 1
end




=begin
menu_options.each {|key, value| value.shuffle}

menu_options = {
  adj: %w[hot cold fresh chilled crispy crunchy seasoned burnt charred creamy],
  cook_style: %w[baked seared roasted boiled grilled blended toasted broiled steamed sauteed],
  food: %w[salmon burgers lettuce watermelon peppers cheese chicken tofu pasta chestnuts]
}

num_items.times do
  print "#{i}. "
  menu_options.each do |key, value|
    print "#{value.pop} "
  end
  puts " "
  i +=1
end
=end
