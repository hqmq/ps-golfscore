require 'spec_helper'
require 'fixtures/games'

describe Golf::RecordBook do
  before do
    subject.record(Game1)
    subject.record(Game2)
  end

  let(:records) { subject.records_for_course(RonJons) }

  it "tracks the top records for each course" do
    binding.pry
    expect(records[0].size).to eq(1)
    expect(records[0].first.total).to eq(9)
    expect(records[0].first.player).to eq(Me)
    
  end

  it "handles ties" do
    expect(records[1].size).to eq(2)
    expect(records[1].first.player).to eq(Jon)
    expect(records[1].last.player).to eq(Me)
  end
end
