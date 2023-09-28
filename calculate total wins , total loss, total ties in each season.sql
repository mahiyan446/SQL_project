WITH team_matches AS (
    SELECT
        match_id,
        season,
        date,
        hometeam_id AS team_id,
        home_goal AS goals_scored,
        away_goal AS goals_conceded
    FROM
        matches
    UNION ALL
    SELECT
        match_id,
        season,
        date,
        awayteam_id AS team_id,
        away_goal AS goals_scored,
        home_goal AS goals_conceded
    FROM
        matches
),
team_results AS (
    SELECT
        match_id,
        season,
        date,
        team_id,
        goals_scored,
        goals_conceded,
        CASE
            WHEN goals_scored > goals_conceded THEN 'Win'
            WHEN goals_scored = goals_conceded THEN 'Draw'
            ELSE 'Loss'
        END AS result
    FROM
        team_matches
)
SELECT
    season,
    team_id,
    SUM(CASE WHEN result = 'Win' THEN 1 ELSE 0 END) AS total_wins,
    SUM(CASE WHEN result = 'Loss' THEN 1 ELSE 0 END) AS total_losses,
    SUM(CASE WHEN result = 'Draw' THEN 1 ELSE 0 END) AS total_draws
FROM
    team_results
GROUP BY
    season,
    team_id;
