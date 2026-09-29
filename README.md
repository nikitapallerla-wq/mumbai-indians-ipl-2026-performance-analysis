# 🏏 Mumbai Indians IPL 2026 Performance Analysis

## 📌 Project Overview

An end-to-end Data Analytics project analyzing Mumbai Indians' IPL 2026 performance using match-level and ball-by-ball data.

The project investigates batting, bowling, player contribution, match phases, opponent performance, and match situations to identify the key factors influencing MI's results.

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
Used for data exploration, aggregation, player/team analysis, CTEs, window functions, ranking, and performance analysis.

### Python — Pandas
Used for data cleaning, exploratory data analysis, performance analysis, and visualization.

### Power BI
Used to build an interactive dashboard for KPI tracking, player analysis, batting and bowling performance, match-phase analysis, and data storytelling.

## 📂 Dataset

The project uses IPL 2026 match-level and ball-by-ball data.

Core datasets:

- `matches.csv` — match results, teams, toss, scores and venues
- `deliveries.csv` — ball-by-ball batting, bowling, runs and wicket data
- `batting_stats.csv` — batting statistics
- `bowling_stats.csv` — bowling statistics
- `fielding_stats.csv` — fielding statistics
- `squads.csv` — team and player information
- `venues.csv` — venue information
- `points_table.csv` — team standings

## 🔍 Analysis Areas

### Team Performance
- Matches played
- Wins and losses
- Win percentage
- Match-by-match results
- Opponent-wise performance
- Venue-wise performance

### Batting Performance
- Total runs
- Top run scorers
- Strike rate
- Fours and sixes
- Player contribution

### Bowling Performance
- Total wickets
- Top wicket-takers
- Runs conceded
- Economy rate
- Bowler contribution

### Match Phase Analysis
- Powerplay: Overs 1–6
- Middle overs: Overs 7–16
- Death overs: Overs 17–20

### Match Situation Analysis
- Batting first vs chasing
- Toss impact
- Close matches
- Opponent performance
- League comparison

## 📊 Project Workflow

```text
Raw IPL Data
      ↓
Data Understanding & Cleaning
      ↓
SQL Analysis
      ↓
Python / Pandas EDA
      ↓
Performance Metrics
      ↓
Power BI Dashboard
      ↓
Key Insights
