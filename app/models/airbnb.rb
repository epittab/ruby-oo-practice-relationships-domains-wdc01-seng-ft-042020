class Listings

    @@all = []

    attr_reader :city
    
    def initialize(city)
        @city = city
        @@all << self
    end

    #Class Methods
    def self.all #tested
        @@all
    end

    def self.find_all_by_city(city) #tested
        #takes an argument of a city name (as a string) and returns all the listings for that city
        self.all.select { |listing| listing.city == city }
    end

    def self.most_popular #tested
        #finds the listing that has had the most trips

        self.all.max { |a, b| a.trip_count <=> b.trip_count }

    end


    #Instance Methods
    def guests #tested
        Trips.all.select { |trip| trip.listing == self }.map { |trip| trip.guest }
    end
    
    def trips #tested
        Trips.all.select { |trip| trip.listing == self }
    end

    def trip_count #tested
        self.trips.length
    end

    
end

class Guests
    attr_reader :name
    @@all = []

    def initialize(name)
      @name = name
        @@all << self
    end

    #Class Methods
    def self.all #tested
        @@all
    end

    def self.pro_traveller #tested
        #returns an array of all guests who have made over 1 trip
        self.all.select { |guest| guest.trips.length > 1}
    end

    def self.find_all_by_name(name)
        #takes an argument of a name (as a string), returns the all guests with that name
        self.all.select { |guest| guest.name == name }
    end

    #Instance Methods
    def listings  #tested
        Trips.all.select { |trip| trip.guest == self }.map { |trip| trip.listing }
    end

    def trips #tested
        Trips.all.select { |trip| trip.guest == self }
    end

    def trip_count #tested
        self.trips.length
    end

    
end

class Trips

    @@all = []

    attr_reader :listing, :guest

    def initialize(listing, guest)
        @listing = listing
        @guest = guest
        @@all << self
    end

    def self.all #tested
        @@all
    end

end
