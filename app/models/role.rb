require 'pry'

class Role < ActiveRecord::Base

    has_many :auditions
    
    def actors
        actors_array = []
        for audition in self.auditions do 
            actors_array << audition.actor
        end
        return actors_array    
    end

    def locations
        locations_array = []
        for audition in self.auditions do
            locations_array << audition.location 
        end
        return locations_array
    end

    def lead
        self.auditions.find_by(hired: TRUE)
    end

    def understudy
        hireds = self.auditions.select{|audition| audition.hired}
        hireds.second
    end



end