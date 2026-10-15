# 🏏 Mumbai Indians IPL 2026 Performance Analysis

An end-to-end Sports Analytics and Business Intelligence project analysing
Mumbai Indians' performance during IPL 2026 using PostgreSQL, Python,
Pandas, Microsoft Excel, and Power BI.

The project explores team results, batting and bowling contributions,
player performance, match situations, and match phases to investigate
performance patterns and identify potential areas for improvement.

## 🎯 Business Objective

To analyse Mumbai Indians' performance across the matches studied,
evaluate team and player contributions, and investigate performance
patterns associated with match outcomes.

### Key Business Questions

- How did Mumbai Indians perform across the matches analysed?
- Which batters contributed most to the team's run scoring?
- Which bowlers contributed most to wicket-taking?
- How did batting and bowling performance vary across match phases?
- Did outcomes differ between batting first and chasing?
- What patterns appeared across wins and losses?
- Which performance areas require further investigation?

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| PostgreSQL | Data exploration, filtering, aggregation, joins, CTEs, and window functions |
| Python | Data analysis and exploratory analysis |
| Pandas | Data manipulation, cleaning, and analysis |
| Microsoft Excel | Calculations, summaries, and spreadsheet-based analysis |
| Power BI | Interactive dashboards, KPI reporting, and data visualisation |

## 📂 Repository Structure

```text
mumbai-indians-ipl-2026-performance-analysis/
│
├── Python/
│   └── MI_IPL_2026_Analysis.ipynb
│
├── Excel/
│   └── MI_IPL_2026_Analysis.xlsx
│
├── sql/
│   └── SQL analysis files
│
├── powerbi/
│   ├── MI_IPL_2026_Dashboard.pbix
│   └── screenshots/
│       ├── MI Performance Analysis - Dashboard.png
│       ├── MI Match & Phase Performance Analysis.png
│       └── MI Player Performance Analysis .png
│
└── README.md
```

The repository contains the analytical files and dashboard deliverables
used throughout the project.

## 📊 Power BI Dashboard

The Power BI report contains three pages covering team performance,
match and phase performance, and individual player contributions.

### 1. Team Performance Overview

This page provides an overview of team results and key performance indicators.

**Analysis includes:**
- Matches played, wins, losses, and win percentage
- Wins and losses by opponent
- Batting first versus chasing
- Toss decisions and match outcomes
- Leading batters and bowlers
- Team scores across matches

![MI Team Performance Dashboard](powerbi/screenshots/MI%20Performance%20Analysis%20-%20Dashboard.png)

### 2. Match and Phase Performance

This page examines match-level results and performance across different
innings phases.

**Analysis includes:**
- MI scores and opponent scores
- Results when batting first and chasing
- Runs scored during the powerplay, middle overs, and death overs
- Wickets lost across batting phases
- Wickets taken across bowling phases

![MI Match and Phase Performance](powerbi/screenshots/MI%20Match%20%26%20Phase%20Performance%20Analysis.png)

### 3. Player Performance Analysis

This page highlights individual contributions from batters and bowlers.

**Analysis includes:**
- Leading batters by runs scored
- Leading batters by strike rate
- Leading bowlers by wickets taken
- Player-level performance comparisons

![MI Player Performance Analysis](powerbi/screenshots/MI%20Player%20Performance%20Analysis%20.png)

## 📈 Key Performance Indicators

The current dashboard reports the following results for the seven
matches analysed.

| KPI | Result |
|---|---:|
| Matches analysed | 7 |
| Wins | 2 |
| Losses | 5 |
| Win percentage | 28.6% |

These indicators summarise the team's results within the analysed dataset
and provide a starting point for investigating performance patterns.

## 🔍 Analytical Approach

### 1. Data Exploration and Preparation

- Examined the available match and player data.
- Prepared the data for analysis using the available tools.
- Reviewed relevant fields and calculation requirements.

### 2. SQL Analysis

- Used filtering, aggregation, and sorting to investigate match results.
- Applied joins to combine relevant data.
- Used Common Table Expressions (CTEs) and window functions for
  analytical queries.
- Examined team and player performance patterns.

### 3. Python and Pandas Analysis

- Used Python and Pandas for data manipulation and analysis.
- Explored batting, bowling, and match-level performance.
- Investigated patterns in the available data.

### 4. Excel Analysis

- Used spreadsheet calculations and summaries.
- Analysed relevant team and player performance metrics.
- Organised findings for reporting.

### 5. Power BI Visualisation

- Developed a multi-page interactive report.
- Presented team KPIs and match outcomes.
- Created visualisations for match phases and player contributions.
- Organised the analysis into a structured dashboard.

## 🔎 Performance Investigation

The project investigates potential performance gaps across four areas.

### Batting Performance

- Run-scoring contributions
- Leading run scorers
- Batting strike rates
- Scoring patterns across match phases

### Bowling Performance

- Wickets taken
- Runs conceded
- Leading wicket-taking bowlers
- Bowling contributions across match phases

### Match Phase Performance

- Powerplay performance
- Middle-over scoring and wicket patterns
- Death-over performance
- Wickets lost and wickets taken across phases

### Match Situations

- Batting first versus chasing
- Toss decisions and match outcomes
- Performance patterns across wins and losses
- Areas requiring further investigation

The objective is to identify patterns supported by the available data
rather than assume that any single metric explains a match result.

## ⚠️ Data Scope and Limitations

- The current dashboard covers seven Mumbai Indians matches from IPL 2026.
- Findings should be interpreted within the scope of the matches analysed.
- KPI values should be checked against the underlying data and
  calculation definitions.
- Observed patterns do not necessarily establish causation.
- Conclusions should be limited to what the analysed data supports.

## 💡 Skills Demonstrated

- SQL querying and data aggregation
- PostgreSQL joins, CTEs, and window functions
- Python and Pandas
- Exploratory Data Analysis (EDA)
- Data cleaning and preparation
- Microsoft Excel analysis
- Power BI dashboard development
- KPI analysis and reporting
- Data validation
- Sports analytics
- Data storytelling

## 🚀 Project Outcome

This project demonstrates an end-to-end analytical workflow combining
SQL, Python, Excel, and Power BI to investigate cricket performance.

The analysis brings together match results, player contributions,
batting and bowling metrics, and match-phase performance in a structured
reporting solution.

The project demonstrates how data analysis and visualisation techniques
can be applied to transform sports data into meaningful performance
insights and communicate findings through interactive dashboards.

---

**Project:** Mumbai Indians IPL 2026 Performance Analysis

**Tools:** PostgreSQL, Python, Pandas, Microsoft Excel, Power BI

**Domain:** Sports Analytics

**Focus Areas:** Data Analysis, KPI Reporting, Data Visualisation,
and Business Intelligence
