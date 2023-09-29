
-- calculating the number of consecutive home wins for each team

SELECT
  hometeam_id,
  MAX(win_streak) AS max_win_streak
FROM (
  SELECT
    hometeam_id,
    SUM(win) OVER (PARTITION BY hometeam_id ORDER BY date) AS win_streak
  FROM (
    SELECT
      hometeam_id,
      CASE WHEN home_goal > away_goal THEN 1 ELSE 0 END AS win
    FROM spanish_football_league_dataset
  ) AS t
) AS t2
GROUP BY hometeam_id
ORDER BY max_win_streak DESC;