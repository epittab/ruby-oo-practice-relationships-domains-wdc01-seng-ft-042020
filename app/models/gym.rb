
class Client

    attr_reader :name
    attr_accessor :trainer

    @@all = []

    def initialize(name)
        @name = name
        @@all << self

    end

    #Class Methods

    def self.all
        @@all
    end


    #Instance Methods

    def assign_trainer(trainer_obj)
        self.trainer = trainer_obj
    end



end


class Trainer

    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    #Class Method
    def self.all
        @@all
    end


    def self.most_clients
        prolific_trainer_hash = {}

        Client.all.each do |cli|
            if prolific_trainer_hash[cli.trainer]
                prolific_trainer_hash[cli.trainer] += 1
            else
                prolific_trainer_hash[cli.trainer] = 1
            end
        end

        prolific_trainer_hash.key(prolific_trainer_hash.values.max)

        # largest_client_value = 0
        # most_popular_trainer = ''

        # prolific_trainer_hash.each do |k, v|
        #     if v > largest_client_value
        #         largest_client_value = v
        #         most_popular_trainer = k
        #     end
        # end

        # return most_popular_trainer

    end

    def self.most_clients_two
        self.all.max { |a, b| a.clients.length <=> b.clients.length }
    end


    def clients
        Client.all.select{ |cli| cli.trainer == self }
    end

    def client_count
        self.clients.length
    end


    def sign_up_for_gym(location)
        TrainerLocation.new(self, location)
    end


end

class Location

    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    # Class Method

    def self.all
        @@all
    end


    def self.least_clients

        self.all.min { |a, b| a.clients_at_location <=> b.clients_at_location }

        # trainer > number of clients

        # location > trainer ... # of clients

        # add up # clients associated to the location



    end

    # Instance Methods

    def clients_at_location
        self.get_trainers.map { |trainer| trainer.client_count }.sum
    end


    def get_trainers

        TrainerLocation.all.select { |tl| tl.location == self }.map { |tl| tl.trainer }

    end


    def add_new_trainer(trainer)
        TrainerLocation.new(trainer, self)
    end


end

class TrainerLocation

    @@all = []

    attr_reader :trainer, :location

    def initialize(trainer, location)
        @trainer, @location = trainer, location
        @@all << self
    end

    def self.all
        @@all
    end



end


#client instances
bob = Client.new("Bob")
mary = Client.new("Mary")
paul = Client.new("Paul")
dave = Client.new("Dave")

#trainer instances
jim = Trainer.new("Jim")
terry = Trainer.new("Terry")

#location instances
dc = Location.new("Washington D.C.")
bmore = Location.new("Baltimore")
barca = Location.new("Barcelona")

#add trainers to locations
dc.add_new_trainer(jim)
barca.add_new_trainer(terry)
bmore.add_new_trainer(jim)


#trainer assignments
bob.assign_trainer(jim)
mary.assign_trainer(jim)
paul.assign_trainer(jim)
dave.assign_trainer(terry)



# puts Client.all.map {|cli| cli.trainer }

# puts Trainer.most_clients.name

puts Location.least_clients.name

# puts dc.clients_at_location
# puts bmore.clients_at_location
# puts barca.clients_at_location

# puts jim.clients