require 'spec_helper'
require 'fixtures/games'

describe Golf::RecordBook do
  before do
    subject.record(Game1)
    subject.record(Game2)
  end

  it "tracks the top 10 records for each course" do

  end
end
