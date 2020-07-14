# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#


# habit = Habit.new(name: "Read 30 minutes", frequency: 1, factor: 28, duration: 2, user_id: 1, category_id: 1)
# habit.save

# habit = Habit.new(name: "Meet with a friend", frequency: 2, factor: 4, duration: 2, user_id: 1, category_id: 2)
# habit.save

# habit = Habit.new(name: "Volunteer", frequency: 1, factor: 4, duration: 3, user_id: 1, category_id: 2)
# habit.save

# category = Category.new(name: "Lifelong Learning", statement: "I want to be a lifelong learner.", user_id: 1)
# category.save

# category = Category.new(name: "Community", statement: "I want to be a good neighbor.", user_id: 1)
# category.save

user = User.new(first_name: "John", last_name: "Doe", email: "johndoe@gmail.com")
user.save

user = User.new(first_name: "Natalie", last_name: "Robinson", email: "natalierobinson@gmail.com")
user.save