DROP TABLE matches;
DROP TABLE teams;
DROP TABLE leagues;


CREATE TABLE teams (
  id SERIAL4 primary key,
  name VARCHAR(255),
  location VARCHAR(255),
  coach VARCHAR(255)
);

CREATE TABLE matches (
  id SERIAL4 primary key,
  home_team_id INT4 references teams(id),
  away_team_id INT4 references teams(id),
  home_team_score INT4,
  away_team_score INT4
);

CREATE TABLE leagues (
  id SERIAL4 primary key,
  team_id INT4 references teams(id),
  team_points INT4
);

