require 'pry'
require 'colorize'

# - the user chooses from a list of main dishes
# - the user chooses 2 side dish items
# - computer repeats users order
# - computer totals lunch items and displays total

@meal_total = 0

@main_dish = [
  "Beef and Egg Empanada", 
  "Vegetarian Empanada", 
  "Chicken and Cheese Empanada",
  "Greek Empanada (Today's Special)"  
]

@side_dish = [
  "White Rice",
  "Brown Rice",
  "Black Beans",
  "Pinto Beans",
  "Pico Salad",
  "Tortilla"

]

@cart = []

def menu
#menu stuff
spacer
print "Welcome to Galata's Empanadas 
1) Start your order
2) View today's menu
3) Exit
"
spacer

menu_choice = gets.strip.to_i
  case menu_choice
    when 1
      # start order
      new_order
    when 2
      # view menu
     lunch_menu_main
     spacer 
     lunch_menu_side
      sleep(2)
      menu
    when 3
      # Leave
      exit
    else
      # Error
      puts "Incorrect option, please choose 1 - 3.".colorize(:red)
  end
end

def spacer
  puts "**************************"
end

def lunch_menu_main
#show all items in main dishes and side dishes
puts "Main Dishes".colorize(:yellow)
@main_dish.each_with_index do |main, i|
  puts "Item: #{i+1} #{main}"
end
end

def lunch_menu_side
puts "Side Dishes".colorize(:green)
@side_dish.each_with_index do |side, i|
  puts "Item: #{i+1} #{side}"
end
end

def new_order
  lunch_menu_main
  puts "Please select your main dish by entering the Item number"
    main_select = gets.to_i
    @cart << @main_dish[ main_select - 1 ]
  lunch_menu_side
  puts "Please select your first side dish"
    side_select = gets.to_i
    @cart << @side_dish[ side_select - 1 ]
  puts "Please select your second side dish"
    side_select = gets.to_i
    @cart << @side_dish[ side_select - 1 ]

checkout
end

def checkout
  puts "Your Order:" 
  puts @cart
  puts "Would you like to purchase? (y/n)"
  check_ans = gets.strip 
  if check_ans == 'y'
    receipt 
  elsif check_ans == 'n'
    menu
  else 
    "Invalid Input (please enter lower case y or n)"
    checkout 
  end
end

def receipt
  spacer
  puts "Thank you for ordering from Galata's Empanadas"
  puts @cart
  spacer
  puts "Your order number is: **#{rand(100)}**"

end

menu