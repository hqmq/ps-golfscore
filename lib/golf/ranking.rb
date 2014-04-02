module Golf
  class Ranking < SimpleDelegator
    include Comparable
    attr_reader :total

    def initialize(total)
      @total = total
      super(SortedSet.new)
    end

    def <=>(other)
      total <=> total
    end
  end
end
