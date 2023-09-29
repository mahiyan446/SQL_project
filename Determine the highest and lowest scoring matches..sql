-- Highest Scoring Match
SELECT
    match_id,
    hometeam_id,
    awayteam_id,
    home_goal,
    away_goal,
    home_goal + away_goal AS total_goals
FROM
    your_table_name
ORDER BY
    total_goals DESC
LIMIT 1;

-- Lowest Scoring Match
SELECT
    match_id,
    hometeam_id,
    awayteam_id,
    home_goal,
    away_goal,
    home_goal + away_goal AS total_goals
FROM
    your_table_name
ORDER BY
    total_goals ASC
LIMIT 1;
