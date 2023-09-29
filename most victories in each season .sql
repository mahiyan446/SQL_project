-- Find the team with the most victories in each season in SQL, including both home wins and away wins

WITH home_wins AS (
  SELECT
    hometeam_id AS team_id,
    season,
    COUNT(*) AS home_wins
  FROM (
    SELECT
      hometeam_id,
      season,
      CASE WHEN home_goal > away_goal THEN 1 ELSE 0 END AS victory
    FROM datacamp_workspace_export
  ) AS t
  GROUP BY team_id, season
)
, away_wins AS (
  SELECT
    awayteam_id AS team_id,
    season,
    COUNT(*) AS away_wins
  FROM (
    SELECT
      awayteam_id,
      season,
      CASE WHEN away_goal > home_goal THEN 1 ELSE 0 END AS victory
    FROM datacamp_workspace_export
  ) AS t
  GROUP BY team_id, season
)
SELECT
  season,
  team_id,
  home_wins + away_wins AS total_wins
FROM home_wins
JOIN away_wins ON home_wins.team_id = away_wins.team_id
ORDER BY season, total_wins DESC;