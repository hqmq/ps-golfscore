require 'fixtures/courses'
require 'fixtures/players'

Game1 = Golf::Game.new(
  id: 1,
  played_at: Time.parse('2013-06-27 13:30:00+0000'),
  course: RonJons,
  scores: [
    {id: 1, player: Me,  holes: [1,1,1,1,1,1,1,1,1]},
    {id: 2, player: Jon, holes: [2,2,2,2,2,2,2,2,2]},
  ]
)

Game2 = Golf::Game.new(
  id: 2,
  played_at: Time.parse('2013-06-28 13:30:00+0000'),
  course: RonJons,
  scores: [
    {id: 3, player: Me,  holes: [3,3,3,3,3,3,3,3,3]},
    {id: 4, player: Jon, holes: [4,4,4,4,4,4,4,4,4]},
  ]
)
