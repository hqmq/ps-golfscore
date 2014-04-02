module Golf
  class RecordBook
    def initialize
      @course_records_map = {}
    end

    def record(game)
      course_records_map[game.course] ||= CourseRecords.new
      course_records_map[game.course].record(game)
    end

    def records_for_course(course)
      course_records_map.fetch(course)
    end

    private
    attr_reader :course_records_map
  end
end
