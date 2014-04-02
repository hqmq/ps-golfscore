require 'fixtures/courses'
require 'fixtures/players'

Game1 = Golf::Game.new(
  id: 1,
  played_at: Time.parse('2013-06-27 13:30:00+0000'),
  course: RonJons,
  scores: [
    {id: 1, participant: Me,  holes: [1,1,1,1,1,1,1,1,1]},
    {id: 2, participant: Jon, holes: [2,2,2,2,2,2,2,2,2]},
  ]
)

Game2 = Golf::Game.new(
  id: 2,
  played_at: Time.parse('2013-06-28 13:30:00+0000'),
  course: RonJons,
  scores: [
    {id: 3, participant: Me,  holes: [2,2,2,2,2,2,2,2,2]},
    {id: 4, participant: Jon, holes: [4,4,4,4,4,4,4,4,4]},
  ]
)
