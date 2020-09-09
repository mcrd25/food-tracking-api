# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
MealType.create([
  {
    name: 'Breakfast',
    description: 'The first meal of the day, make sure it\'s balanced and healthy'
  },
  {
    name: 'Lunch',
    description: 'Try and keep it light and healthy, nothing to heavy'
  },
  {
    name: 'Dinner',
    description: 'Keep it balanced. If you workout at night make sure it\'s high in protein'
  },
  {
    name: 'Snack',
    description: 'We all deserve a cheat. Try and keep it healthy though!'
  }
])
