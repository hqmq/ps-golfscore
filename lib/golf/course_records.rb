module Golf
  class CourseRecords < SimpleDelegator
    def initialize
      super(SortedSet.new)
    end

    def record(game)
      grouped_scores = game.scores.group_by(&:total)
      rankings = grouped_scores.each do |total, scores|
        ranking = Ranking.new(total)
        scores.each do |score|
          ranking << Record.new(score, game)
        end
        self << ranking
      end
    end
  end
end
