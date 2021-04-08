class Waiter
    attr_reader :name, :yrs_experience

    @@all = [] 

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end
    
    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        meal = Meal.new(self, customer, total, tip)
        meal
    end

    def meals
        Meal.all.select{|meal| meal.waiter == self}
    end

    def best_tipper
        best_tip = meals.max do |meal_1, meal_2|
            meal_1.tip <=> meal_2.tip
        end
        best_tip.customer
    end

end