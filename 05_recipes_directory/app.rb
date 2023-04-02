require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes_directory')

# Perform a SQL query on the database and get the result set.
recipe_repository = RecipeRepository.new
# Print out each record from the result set .
recipe_repository.all.each do |recipe|
  p recipe
end

# Get the recipe with id = 2
recipe = recipe_repository.find(2)

puts recipe.id
puts recipe.name
puts recipe.cooking_time
puts recipe.rating