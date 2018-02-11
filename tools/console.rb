require_relative '../config/environment.rb'



### USER
brooke = User.new("Brooke")
scarlett = User.new("Scarlett")
yalof = User.new("Yalof")

### RECIPE
pasta_recipe = Recipe.new("pasta with peas")
vodka_sauce_recipe = Recipe.new("vodka sauce")
pesto_sauce = Recipe.new("pesto sauce")
limone = Recipe.new("limone")

### INGREDIENT
pea = Ingredient.new("pea")
pasta = Ingredient.new("pasta")
water = Ingredient.new("water")
oil = Ingredient.new("oil")
salt = Ingredient.new("salt")
pepper = Ingredient.new("pepper")

### RECIPE CARD
pasta_with_peas = RecipeCard.new(brooke, pasta_recipe, "18-05-17 12:01:01", 5)
pasta_with_peas_two = RecipeCard.new(brooke, pasta_recipe, "18-08-17 12:01:01", 7)
pasta_with_vodka_sauce = RecipeCard.new(brooke, vodka_sauce_recipe, "18-09-17 12:01:01", 10)
pasta_with_vodka_sauce = RecipeCard.new(brooke, limone, "18-11-17 12:01:01", 3)

### RECIPE INGREDIENT
pasta_ingredient = RecipeIngredient.new(pasta_recipe, pea)
pasta_ingredient2 = RecipeIngredient.new(pasta_recipe, pasta)

### ALLERGEN
pea = Allergen.new(brooke, pea)
pasta = Allergen.new(scarlett, pea)

##RECIPE
Recipe.most_popular
pasta_recipe.users
pasta_recipe.ingredients
pasta_recipe.allergens
pasta_recipe.add_ingredients([water, oil, salt, pepper])

##USER TESTS
brooke.recipes
brooke.add_recipe_card(pesto_sauce, "18-06-17 12:01:01", 10)
brooke.declare_allergen(pasta)
brooke.allergens
brooke.top_three_recipes
brooke.most_recent_recipe

##Ingredient
Ingredient.most_common_allergen

binding.pry
