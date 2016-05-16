require_relative('models/team.rb')
require_relative('models/match.rb')
require('pry-byebug')

Team.delete_all()
Match.delete_all()

  team1 = Team.new({ 'name' => 'The Granite Planets', 'location' => 'Aberdeen', 'coach' => 'A'})
  team2 = Team.new({ 'name' => 'Codeclan Crushers', 'location' => 'Edinburgh', 'coach' => 'B'})


  t1 = team1.save()
  t2 = team2.save()


  match1 = Match.new({ 'home_team_id' => t1.id, 'away_team_id' => t2.id, 'home_team_score' => 2, 'away_team_score' => 1 })


  m1 = match1.save()

  

  binding.pry
  nil
