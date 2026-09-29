/*
============================================================
MUMBAI INDIANS IPL 2026 PERFORMANCE ANALYSIS
GitHub SQL Portfolio Project

Objective:
Analyze Mumbai Indians (MI) performance in IPL 2026 using
match-level and ball-by-ball data.

Core questions:
1. How did MI perform overall?
2. Which players drove batting performance?
3. How effective was the bowling unit?
4. Which innings phases were strongest/weakest?
5. How did MI perform against different opponents?
6. Did batting first vs chasing affect results?
7. How did MI compare with the rest of the league?

Database: PostgreSQL
Source tables:
    matches
    deliveries
    batting_stats
    bowling_stats
    fielding_stats
    points_table
    squads
    venues

Team code used in match/delivery tables: MI
Toss decision values in matches: 'Bat' and 'Bowl'
Wicket type values include 'runout' (not 'run out')
============================================================
*/


/* ==========================================================
   SECTION 1 — TEAM PERFORMANCE
   ========================================================== */

-- 1. MI overall match record
SELECT
    COUNT(*) AS matches_played,
    SUM(CASE WHEN match_winner = 'MI' THEN 1 ELSE 0 END) AS wins,
    SUM(
        CASE
            WHEN match_winner IS NOT NULL
             AND match_winner <> 'MI'
            THEN 1 ELSE 0
        END
    ) AS losses
FROM matches
WHERE team1 = 'MI'
   OR team2 = 'MI';


-- 2. MI win percentage
SELECT
    COUNT(*) AS matches_played,
    SUM(CASE WHEN match_winner = 'MI' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN match_winner <> 'MI' THEN 1 ELSE 0 END) AS losses,
    ROUND(
        100.0 * SUM(CASE WHEN match_winner = 'MI' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS win_percentage
FROM matches
WHERE team1 = 'MI'
   OR team2 = 'MI';


-- 3. Match-by-match MI results
SELECT
    match_id,
    date,
    venue,
    team1,
    team2,
    toss_winner,
    toss_decision,
    first_ings_score,
    second_ings_score,
    match_winner,
    player_of_the_match
FROM matches
WHERE team1 = 'MI'
   OR team2 = 'MI'
ORDER BY date;


/* ==========================================================
   SECTION 2 — OPPONENT & VENUE ANALYSIS
   ========================================================== */

-- 4. MI performance against each opponent
SELECT
    CASE
        WHEN team1 = 'MI' THEN team2
        ELSE team1
    END AS opponent,
    COUNT(*) AS matches,
    SUM(CASE WHEN match_winner = 'MI' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN match_winner <> 'MI' THEN 1 ELSE 0 END) AS losses,
    ROUND(
        100.0 * SUM(CASE WHEN match_winner = 'MI' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS win_percentage
FROM matches
WHERE team1 = 'MI'
   OR team2 = 'MI'
GROUP BY opponent
ORDER BY win_percentage DESC, matches DESC;


-- 5. MI performance by venue
SELECT
    venue,
    COUNT(*) AS matches,
    SUM(CASE WHEN match_winner = 'MI' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN match_winner <> 'MI' THEN 1 ELSE 0 END) AS losses
FROM matches
WHERE team1 = 'MI'
   OR team2 = 'MI'
GROUP BY venue
ORDER BY wins DESC, matches DESC;


/* ==========================================================
   SECTION 3 — BATTING ANALYSIS
   ========================================================== */

-- 6. MI total batting output
SELECT
    SUM(runs_of_bat) AS runs_from_bat,
    SUM(extras) AS extras,
    SUM(runs_of_bat + extras) AS total_runs
FROM deliveries
WHERE batting_team = 'MI';


-- 7. Top MI run scorers
SELECT
    striker AS batsman,
    SUM(runs_of_bat) AS runs,
    COUNT(DISTINCT match_no) AS matches,
    COUNT(*) FILTER (WHERE runs_of_bat = 4) AS fours,
    COUNT(*) FILTER (WHERE runs_of_bat = 6) AS sixes
FROM deliveries
WHERE batting_team = 'MI'
GROUP BY striker
ORDER BY runs DESC;


-- 8. MI batting strike rate
SELECT
    striker AS batsman,
    SUM(runs_of_bat) AS runs,
    COUNT(*) FILTER (WHERE wide = 0) AS balls_faced,
    ROUND(
        100.0 * SUM(runs_of_bat)
        / NULLIF(COUNT(*) FILTER (WHERE wide = 0), 0),
        2
    ) AS strike_rate
FROM deliveries
WHERE batting_team = 'MI'
GROUP BY striker
HAVING COUNT(*) FILTER (WHERE wide = 0) >= 20
ORDER BY strike_rate DESC;


-- 9. MI boundary contribution
SELECT
    COUNT(*) FILTER (WHERE runs_of_bat = 4) AS fours,
    COUNT(*) FILTER (WHERE runs_of_bat = 6) AS sixes,
    SUM(
        CASE
            WHEN runs_of_bat IN (4, 6) THEN runs_of_bat
            ELSE 0
        END
    ) AS boundary_runs
FROM deliveries
WHERE batting_team = 'MI';


-- 10. Player contribution to MI total runs
WITH player_runs AS (
    SELECT
        striker AS batsman,
        SUM(runs_of_bat) AS runs
    FROM deliveries
    WHERE batting_team = 'MI'
    GROUP BY striker
),
team_total AS (
    SELECT
        SUM(runs_of_bat + extras) AS total_team_runs
    FROM deliveries
    WHERE batting_team = 'MI'
)
SELECT
    p.batsman,
    p.runs,
    ROUND(
        100.0 * p.runs / NULLIF(t.total_team_runs, 0),
        2
    ) AS percentage_of_team_runs
FROM player_runs p
CROSS JOIN team_total t
ORDER BY percentage_of_team_runs DESC;


/* ==========================================================
   SECTION 4 — BOWLING ANALYSIS
   ========================================================== */

-- 11. MI wicket takers
SELECT
    bowler,
    COUNT(*) AS wickets
FROM deliveries
WHERE bowling_team = 'MI'
  AND wicket_type IS NOT NULL
  AND wicket_type NOT IN (
      'run out',
      'runout',
      'retired hurt',
      'obstructing the field'
  )
GROUP BY bowler
ORDER BY wickets DESC;


-- 12. MI bowling workload and runs conceded
-- Byes and leg-byes are excluded from bowler runs conceded.
SELECT
    bowler,
    SUM(
        runs_of_bat + extras - byes - legbyes
    ) AS runs_conceded,
    COUNT(*) FILTER (
        WHERE wide = 0
          AND noballs = 0
    ) AS legal_balls
FROM deliveries
WHERE bowling_team = 'MI'
GROUP BY bowler
ORDER BY runs_conceded DESC;


-- 13. MI bowling economy rate
SELECT
    bowler,
    SUM(
        runs_of_bat + extras - byes - legbyes
    ) AS runs_conceded,
    COUNT(*) FILTER (
        WHERE wide = 0
          AND noballs = 0
    ) AS legal_balls,
    ROUND(
        6.0 * SUM(
            runs_of_bat + extras - byes - legbyes
        )
        / NULLIF(
            COUNT(*) FILTER (
                WHERE wide = 0
                  AND noballs = 0
            ),
            0
        ),
        2
    ) AS economy_rate
FROM deliveries
WHERE bowling_team = 'MI'
GROUP BY bowler
HAVING COUNT(*) FILTER (
    WHERE wide = 0
      AND noballs = 0
) >= 30
ORDER BY economy_rate;


/* ==========================================================
   SECTION 5 — MATCH PHASE ANALYSIS
   ========================================================== */

-- 14. MI batting: powerplay
SELECT
    SUM(runs_of_bat + extras) AS powerplay_runs,
    COUNT(*) FILTER (
        WHERE wicket_type IS NOT NULL
    ) AS wickets_lost
FROM deliveries
WHERE batting_team = 'MI'
  AND over < 6;


-- 15. MI batting: middle overs
SELECT
    SUM(runs_of_bat + extras) AS middle_over_runs,
    COUNT(*) FILTER (
        WHERE wicket_type IS NOT NULL
    ) AS wickets_lost
FROM deliveries
WHERE batting_team = 'MI'
  AND over BETWEEN 6 AND 15;


-- 16. MI batting: death overs
SELECT
    SUM(runs_of_bat + extras) AS death_over_runs,
    COUNT(*) FILTER (
        WHERE wicket_type IS NOT NULL
    ) AS wickets_lost
FROM deliveries
WHERE batting_team = 'MI'
  AND over >= 16;


-- 17. MI bowling: phase-wise performance
SELECT
    CASE
        WHEN over < 6 THEN 'Powerplay'
        WHEN over BETWEEN 6 AND 15 THEN 'Middle Overs'
        ELSE 'Death Overs'
    END AS phase,

    SUM(
        runs_of_bat + extras - byes - legbyes
    ) AS runs_conceded,

    COUNT(*) FILTER (
        WHERE wicket_type IS NOT NULL
          AND wicket_type NOT IN (
              'run out',
              'runout',
              'retired hurt',
              'obstructing the field'
          )
    ) AS wickets
FROM deliveries
WHERE bowling_team = 'MI'
GROUP BY phase
ORDER BY
    CASE phase
        WHEN 'Powerplay' THEN 1
        WHEN 'Middle Overs' THEN 2
        WHEN 'Death Overs' THEN 3
    END;


/* ==========================================================
   SECTION 6 — MATCH SITUATIONS
   ========================================================== */

-- 18. Batting first vs chasing
SELECT
    CASE
        WHEN (
            (toss_winner = 'MI' AND toss_decision = 'Bat')
            OR
            (toss_winner <> 'MI' AND toss_decision = 'Bowl')
        )
        THEN 'Batting First'
        ELSE 'Chasing'
    END AS innings_strategy,

    COUNT(*) AS matches,

    SUM(
        CASE
            WHEN match_winner = 'MI'
            THEN 1 ELSE 0
        END
    ) AS wins,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN match_winner = 'MI'
                THEN 1 ELSE 0
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS win_percentage

FROM matches
WHERE team1 = 'MI'
   OR team2 = 'MI'
GROUP BY innings_strategy;


-- 19. Toss impact
SELECT
    COUNT(*) AS toss_wins,

    SUM(
        CASE
            WHEN match_winner = 'MI'
            THEN 1 ELSE 0
        END
    ) AS matches_won_after_toss,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN match_winner = 'MI'
                THEN 1 ELSE 0
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS win_percentage_after_winning_toss

FROM matches
WHERE toss_winner = 'MI';


-- 20. Close MI matches
SELECT
    match_id,
    date,
    venue,
    team1,
    team2,
    match_winner,
    wb_runs,
    wb_wickets,
    balls_left
FROM matches
WHERE (team1 = 'MI' OR team2 = 'MI')
  AND (
      (wb_runs IS NOT NULL AND wb_runs <= 10)
      OR
      (wb_wickets IS NOT NULL AND wb_wickets <= 3)
  )
ORDER BY date;


/* ==========================================================
   SECTION 7 — ADVANCED SQL
   ========================================================== */

-- 21. MI batsmen ranked by runs
WITH player_runs AS (
    SELECT
        striker AS batsman,
        SUM(runs_of_bat) AS runs
    FROM deliveries
    WHERE batting_team = 'MI'
    GROUP BY striker
)
SELECT
    batsman,
    runs,
    DENSE_RANK() OVER (
        ORDER BY runs DESC
    ) AS batting_rank
FROM player_runs
ORDER BY batting_rank;


-- 22. MI top 5 batsmen by runs
WITH player_runs AS (
    SELECT
        striker AS batsman,
        SUM(runs_of_bat) AS runs
    FROM deliveries
    WHERE batting_team = 'MI'
    GROUP BY striker
),
ranked_players AS (
    SELECT
        batsman,
        runs,
        DENSE_RANK() OVER (
            ORDER BY runs DESC
        ) AS batting_rank
    FROM player_runs
)
SELECT
    batsman,
    runs,
    batting_rank
FROM ranked_players
WHERE batting_rank <= 5
ORDER BY batting_rank;


/* ==========================================================
   SECTION 8 — LEAGUE COMPARISON
   ========================================================== */

-- 23. Team batting output compared across the league
SELECT
    batting_team AS team,
    COUNT(DISTINCT match_no) AS matches,
    SUM(runs_of_bat + extras) AS total_runs,
    ROUND(
        SUM(runs_of_bat + extras) * 1.0
        / NULLIF(COUNT(DISTINCT match_no), 0),
        2
    ) AS runs_per_match
FROM deliveries
GROUP BY batting_team
ORDER BY runs_per_match DESC;


-- 24. Team points table comparison
SELECT
    position,
    team,
    matches,
    wins,
    defeats,
    points,
    nrr
FROM points_table
ORDER BY position;


/* ==========================================================
   SECTION 9 — MI FINAL SUMMARY
   ========================================================== */

-- 25. Portfolio summary KPI query
WITH match_summary AS (
    SELECT
        COUNT(*) AS matches,
        SUM(CASE WHEN match_winner = 'MI' THEN 1 ELSE 0 END) AS wins
    FROM matches
    WHERE team1 = 'MI'
       OR team2 = 'MI'
),
batting_summary AS (
    SELECT
        SUM(runs_of_bat + extras) AS total_runs
    FROM deliveries
    WHERE batting_team = 'MI'
),
bowling_summary AS (
    SELECT
        COUNT(*) FILTER (
            WHERE wicket_type IS NOT NULL
              AND wicket_type NOT IN (
                  'run out',
                  'retired hurt',
                  'obstructing the field'
              )
        ) AS wickets
    FROM deliveries
    WHERE bowling_team = 'MI'
)
SELECT
    m.matches,
    m.wins,
    m.matches - m.wins AS losses,
    ROUND(
        100.0 * m.wins / NULLIF(m.matches, 0),
        2
    ) AS win_percentage,
    b.total_runs,
    bo.wickets
FROM match_summary m
CROSS JOIN batting_summary b
CROSS JOIN bowling_summary bo;


/*
============================================================
END OF IPL 2026 MI PERFORMANCE ANALYSIS
============================================================
*/

