 class User

   attr_accessor :name

   @@all = []

   def initialize(name)
     @name = name
     @@all << self
   end

   def self.all
     @@all
   end

   def recipes
     ##should return all of the recipes this user has recipe cards for
     ##iterate through RC and find recipes where user = self
     RecipeCard.all.select {|rc| rc.user == self}.map {|rc| rc.recipe}
   end

   def add_recipe_card(recipe, date, rating)
     #new_recipe_card = RecipeCard.new(self, recipe, date, dating)
     #should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe
     RecipeCard.new(recipe, self, date, rating)
   end

   def declare_allergen(ingredient)
     #should accept an ingredient instance as an argument, and create a new allergen instance for this user and the given ingredient
     Allergen.new(self, ingredient)
   end

   def allergens
     #should return all of the ingredients this user is allergic to
     Allergen.all.select {|allergen| allergen.user == self}.map {|allergen| allergen.ingredient}
   end

   def top_three_recipes
     #should return the top three highest rated recipes for this user.
     RecipeCard.all.sort_by {|rc| rc.rating}.reverse[0..2]
   end

   def most_recent_recipe
     #RecipeCard.all.select {|rc| rc.user == self}.last
     RecipeCard.all.sort_by {|rc| rc.date}.last
   end


 end
