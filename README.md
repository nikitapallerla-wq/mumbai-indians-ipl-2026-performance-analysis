# 🏏 Mumbai Indians IPL 2026 Performance Analysis

## 📌 Project Overview

An end-to-end Data Analytics project analyzing Mumbai Indians' IPL 2026 performance using match-level and ball-by-ball data.

The project investigates batting, bowling, player contribution, match phases, opponent performance, and match situations to identify the key factors influencing MI's results.

The project demonstrates the application of SQL, Python, Excel, and Power BI to sports performance analysis and business intelligence.

## 🎯 Business Question

> What factors are influencing Mumbai Indians' performance in IPL 2026?

The analysis focuses on:

- Team wins, losses, and win percentage
- Batting performance and player contribution
- Bowling performance and economy
- Powerplay, middle-over, and death-over performance
- Batting first vs chasing
- Toss impact
- Opponent-wise performance
- Venue-wise performance
- MI's performance compared with other teams

## 🛠️ Tools & Technologies

### SQL — PostgreSQL

Used for data exploration, aggregation, player and team analysis, Common Table Expressions (CTEs), window functions, ranking, and performance analysis.

### Python — Pandas

Used for data inspection, cleaning, exploratory data analysis, performance analysis, and visualization.

### Microsoft Excel

Used for spreadsheet-based analysis, calculations, performance summaries, and reporting.

### Power BI

Used to develop an interactive dashboard for KPI tracking, player analysis, batting and bowling performance, match-phase analysis, and data storytelling.

## 📂 Dataset

The project uses IPL 2026 match-level and ball-by-ball data.

Core datasets include:

| Dataset | Description |
|---|---|
| `matches.csv` | Match results, teams, toss information, scores, and venues |
| `deliveries.csv` | Ball-by-ball batting, bowling, runs, and wicket information |
| `batting_stats.csv` | Batting statistics |
| `bowling_stats.csv` | Bowling statistics |
| `fielding_stats.csv` | Fielding statistics |
| `squads.csv` | Team and player information |
| `venues.csv` | Venue information |
| `points_table.csv` | Team standings |

The datasets used by individual tools may differ depending on the analysis performed.

## 🔍 Analysis Areas

### 1. Team Performance

- Matches played
- Wins and losses
- Win percentage
- Match-by-match results
- Opponent-wise performance
- Venue-wise performance

### 2. Batting Performance

- Total runs
- Top run scorers
- Strike rate
- Fours and sixes
- Individual player contribution
- Batting performance across matches

### 3. Bowling Performance

- Total wickets
- Top wicket-takers
- Runs conceded
- Economy rate
- Bowler contribution
- Bowling performance across matches

### 4. Match Phase Analysis

Performance is examined across three phases:

- **Powerplay:** Overs 1–6
- **Middle overs:** Overs 7–16
- **Death overs:** Overs 17–20

The analysis investigates scoring patterns, wicket-taking performance, and run-concession trends across these phases.

### 5. Match Situation Analysis

- Batting first vs chasing
- Toss impact
- Close matches
- Opponent-wise performance
- Venue-wise trends
- Comparison with other teams

## 📊 Project Workflow

```text
Raw IPL Data
      ↓
Data Understanding and Cleaning
      ↓
SQL Analysis — PostgreSQL
      ↓
Python Analysis — Pandas
      ↓
Excel Analysis
      ↓
Performance Metrics and Validation
      ↓
Power BI Dashboard
      ↓
Key Insights and Recommendations
