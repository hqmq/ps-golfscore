module Golf 
  class Game
    include Virtus.model(:finalize => false)

    attribute :id, Integer
    attribute :played_at, Time
    attribute :created_at, Time
    attribute :updated_at, Time
    attribute :course, 'Golf::Course'
    attribute :scores, Array['Golf::Score']

    def to_flat_hash
      {
        :course_name => course.name,
        :id => id,
        :played_at => played_at.iso8601,
      }
    end
  end
end
