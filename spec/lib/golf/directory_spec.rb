require 'spec_helper'

describe Golf::Directory do
  let(:player) { Golf::Player.new(id: 12, name: 'Ron Swanson') }
  let(:player2) { Golf::Player.new(id: 13, name: 'Tammy I') }
  let(:team) { Golf::Team.new(id: 50, name: 'Wood Workers', players: [player]) }

  describe "#add" do
    it "creates a new entry for a player" do
      subject.add(player)
      expect(subject.count).to eq(1)
    end

    it "raises an exception for duplicates" do
      subject.add(player)
      expect{ subject.add(player) }.to raise_error(Golf::DuplicateRecord)
    end

    it "creates a new team" do
      subject.add(player)
      subject.add(team)
      expect(subject.count).to eq(2)
    end

    it "Adds new team players" do
      team.players << player2
      subject.add(team)
      expect(subject.count).to eq(3)
    end
  end

  describe "#find_by_id" do
    before { subject.add(team) }

    it "returns a player or team" do
      expect(subject.find_by_id(player.id)).to eq(player)
      expect(subject.find_by_id(team.id)).to eq(team)
    end

    it "raises an exception for unknown ids" do
      expect{ subject.find_by_id(nil) }.to raise_error(Golf::UnknownRecord)
    end
  end
end
