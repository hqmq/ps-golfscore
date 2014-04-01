require 'spec_helper'

describe Golf::Directory do
  let(:player) { Golf::Player.new(id: 12, name: 'Ron Swanson') }

  describe "#add" do
    it "creates a new entry for a player" do
      subject.add(player)
      expect(subject.count).to eq(1)
    end

    it "raises an exception for duplicates" do
      subject.add(player)
      expect{ subject.add(player) }.to raise_error(Golf::DuplicateRecord)
    end
  end
end
