require 'recipe_repository'

RSpec.describe RecipeRepository do

  def reset_recipes_table
		seed_sql = File.read('spec/seeds_recipes.sql')
		connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
		connection.exec(seed_sql)
	end

	before(:each) do 
    reset_recipes_table
  end

    it 'returns two recipes' do
      repo = RecipeRepository.new
      recipe = repo.all 
      expect(recipe.length).to eq (2)
      expect(recipe.first.id).to eq ('1')
      expect(recipe.first.name).to eq ('Pizza')
      expect(recipe.first.cooking_time).to eq ('60')
      expect(recipe.first.rating).to eq ('5')
    end

    it 'returns the one single recipe' do
      repo = RecipeRepository.new
      recipe = repo.find(2)
      expect(recipe.name).to eq ('Lasagna')
      expect(recipe.cooking_time).to eq ('240')
      expect(recipe.rating).to eq ('5')
    end
end
