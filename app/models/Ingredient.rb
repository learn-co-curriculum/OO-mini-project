class Ingredient

  attr_accessor :ingredient_name

  @@all = []

  def initialize(ingredient_name)
    @ingredient_name = ingredient_name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    allergen_hash= {}
    Allergen.all.each do |allergen|
      if allergen_hash[allergen.ingredient] == nil
        #binding.pry
        allergen_hash[allergen.ingredient] = 1
       else
        allergen_hash[allergen.ingredient] += 1
      end
    end
    #sort through allergen_hash and return where allergen_hash value is the highest
    allergen_hash.sort_by{|_key, value| value}.reverse.first[0]
  end


end
