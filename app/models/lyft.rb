class Passengers

    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    #Class methods

    def self.all
        @@all
    end

    def self.premium_members #tested
        #should find all passengers who have travelled over 100 miles with the service
        self.all.select { |inst| inst.total_distance > 100.0 }.map { |inst| inst.name }
    end



    #Instance Methods

    def total_distance #tested
        #should calculate the total distance the passenger has travelled with the service
        self.rides.map { |ride| ride.distance }.sum
    end

    def rides #tested
        #returns all rides a passenger has been on
        Rides.all.select { |ride| ride.passenger == self}
    end

    def drivers #tested
        #returns all drivers a passenger has ridden with
        self.rides.map{ |ride| ride.driver }
    end




end


class Drivers

    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    #Class Methods

    def self.all
        @@all
    end

    def self.mileage_cap(distance) #tested
        #takes an argument of a distance (float) and returns all drivers who have exceeded that mileage
        self.all.select { |inst| inst.total_distance > distance }
    end

    #Instance Methods

    def passenger #tested
        #returns all passengers a driver has had
        self.rides.map{ |ride| ride.passenger }
    end

    def rides #tested
        #returns all rides a driver has made
        Rides.all.select { |ride| ride.driver == self}
    end

    # helper
    def total_distance
        self.rides.map { |ride| ride.distance }.sum
    end



end


class Rides

    attr_reader :distance, :passenger, :driver

    @@all = []

    def initialize(passenger, driver, distance)
        @driver = driver
        @passenger = passenger
        @distance = distance
        @@all << self
    end

    def self.all
        @@all
    end


    def self.average_distance # tested
        #should find the average distance of all rides
        self.all.map { |ride| ride.distance}.sum(0.0) / self.all.length
    end





end


billy = Passengers.new("Billy")
bob = Passengers.new("Bob")
mary = Passengers.new("Mary")

sue = Drivers.new("Sue")
david = Drivers.new("David")
henry = Drivers.new("Henry")

ride1 = Rides.new(billy, sue, 100.2)
ride2 = Rides.new(bob, sue, 15.4)
ride3 = Rides.new(billy, david, 68.2)
ride4 = Rides.new(billy, henry, 7.5)
ride5 = Rides.new(mary, david, 160.2)
ride6 = Rides.new(mary, sue, 230.9)
ride7 = Rides.new(billy, sue, 20.1)


puts Rides.average_distance
puts sue.passenger
puts sue.rides

puts bob.rides
puts mary.drivers
puts billy.total_distance
puts Passengers.premium_members


puts Drivers.mileage_cap(200.0)