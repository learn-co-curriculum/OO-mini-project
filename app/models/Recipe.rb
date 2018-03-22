class Recipe

  attr_accessor :recipe_name

  @@all = []

  def initialize(recipe_name)
    @recipe_name = recipe_name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    ##
    recipe_count_hash = {}
    RecipeCard.all.select do |rc|
      if recipe_count_hash[rc.recipe] == nil
        recipe_count_hash[rc.recipe] = 1
      else
        recipe_count_hash[rc.recipe] += 1
      end
    end
    recipe_count_hash.sort_by{|_key, value| value}.reverse.first[0]
  end

  def users
    #should return the user instances who have recipe cards with this recipe
    RecipeCard.all.select{|rc| rc.recipe == self}.map{|rc| rc.user}
  end

  def ingredients
    # should return all of the ingredients in this recipe
    RecipeIngredient.all.select{|rc| rc.recipe == self}.map{|rc| rc.ingredient}
  end

  def allergens
    # should return all of the ingredients in this recipe that are allergens
    Allergen.all.select{|allergen| self.ingredients.include?(allergen.ingredient)}
  end

  def add_ingredients(ingredient_array)
    # should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
    ingredient_array.map do |ingredient_instance|
      RecipeIngredient.new(self, ingredient_instance)
    end
  end

end
