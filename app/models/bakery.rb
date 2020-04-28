class Bakeries

    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end


    def ingredients
        #should return an array of ingredients for the bakery's desserts
        self.desserts.map { |dessert| dessert.ingredients }
    end

    def desserts
        #should return an array of desserts the bakery makes
        Desserts.all.select { |dessert| dessert.bakery == self }
        
    end

    def average_calories
        #should return a number totaling the average number of calories for the desserts sold at this bakery
        dessert_calories_array = self.desserts.map { |dessert| dessert.calories }
        dessert_calories_array.sum(0.0) / dessert_calories_array.length
    end

    def shopping_list
        #should return a string of names for ingredients for the bakery
        self.ingredients.flatten.map { |ing| ing.name}
    end

end


class Desserts

    attr_reader :name, :bakery
    @@all = []

    def initialize(name, bakery)
        @name = name
        @bakery = bakery
        @@all << self
    end

    def self.all
        @@all
    end


    def ingredients
        #should return an array of ingredients for the dessert
        Ingredients.all.select { |ing| ing.dessert == self }
    end


    def calories
        #should return a number totaling all the calories for all the ingredients included in that dessert
        total_calories = 0
        self.ingredients.each { |ing| total_calories += ing.calorie }
        return total_calories
    end

end

class Ingredients

    attr_reader :name, :calorie, :dessert

    @@all = []

    def initialize(name, calorie, dessert)
        @name = name
        @dessert = dessert
        @calorie = calorie
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_all_by_name(ingredient)
        #should take a string argument return an array of all ingredients that include that string in their name
        #make sure you aren't just looking for exact matches (like 'chocolate' =='chocolate')
        self.all.select { |ing| ing.ingredient == self.name }
    end


    def bakery
        #should return the bakery object for the bakery that uses that ingredient
        self.dessert.bakery
    end



end


bb = Bakeries.new("Best Bread")
hd = Bakeries.new("Honey Dew")
hl = Bakeries.new("Heavenly Loaf")

cc = Desserts.new("Chocolate Cake", bb)
pc = Desserts.new("Pound Cake", hd)
ce = Desserts.new("Chocolate Eclair", hl)
ce2 = Desserts.new("Chocolate Eclair", bb)
ce3 = Desserts.new("Chocolate Eclair", hd)
almond_s = Desserts.new("Almond Scone", hd)

egg1 = Ingredients.new("2 Eggs", 90, cc)
egg2 = Ingredients.new("3 Eggs", 135, pc)
egg3 = Ingredients.new("5 Eggs", 225, ce)
almond = Ingredients.new("1 cup Almonds", 30, almond_s)
chocolate = Ingredients.new("1/2 cup dark chocolate", 100, cc)
chocolate2 = Ingredients.new("1/2 cup milk chocolate", 100, ce)
chocolate3 = Ingredients.new("1/2 cup milk chocolate", 100, ce2)
chocolate4 = Ingredients.new("1/2 cup milk chocolate", 100, ce3)
butter = Ingredients.new("1 stick of Butter", 200, pc)

puts bb.average_calories
print bb.shopping_list