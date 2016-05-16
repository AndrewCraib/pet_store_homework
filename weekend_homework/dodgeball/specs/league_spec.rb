require('minitest/autorun')
require_relative('../models/league')
require_relative('../models/team')
require_relative('../models/match')

class TestSales < Minitest::Test

  def setup
    
    team1 = Team.new({ 'name' => 'The Granite Planets', 'location' => 'Aberdeen', 'coach' => 'A'})
    team2 = Team.new({ 'name' => 'Codeclan Crushers', 'location' => 'Edinburgh', 'coach' => 'B'})


    t1 = team1.save()
    t2 = team2.save()


    match1 = Match.new({ 'home_team_id' => t1.id, 'away_team_id' => t2.id, 'home_team_score' => 2, 'away_team_score' => 1 })


    m1 = match1.save()


    @teams = [t1, t2]
    @league = League.new(@teams)
    
  end