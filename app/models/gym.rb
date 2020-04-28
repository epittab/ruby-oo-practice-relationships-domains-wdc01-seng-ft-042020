
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

    def initialize(name)
        @name = name
        
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

    def clients
        Client.all.select{ |cli| cli.trainer == self }.length
    end



end

class Location

    attr_reader :name

    def initialize(name)
        @name = name
    end

    def self.least_clients


        # trainer > number of clients

        # location > trainer ... # of clients

        # add up # clients associated to the location



    end

    def get_trainers

        TrainerLocation.all.select { |tl| tl.location == self }.map { |tl| tl.trainer }

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

#trainer assignments
bob.assign_trainer(jim)
mary.assign_trainer(jim)
paul.assign_trainer(jim)
dave.assign_trainer(terry)


# puts Client.all.map {|cli| cli.trainer }

# puts Trainer.most_clients.name

puts jim.clients