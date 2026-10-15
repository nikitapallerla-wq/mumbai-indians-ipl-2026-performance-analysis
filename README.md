# 🏏 Mumbai Indians IPL 2026 Performance Analysis

An end-to-end Data Analytics project investigating Mumbai Indians'
IPL 2026 performance using PostgreSQL, Python, Pandas, Microsoft Excel,
and Power BI.

The project examines team results, batting and bowling contributions,
player performance, match situations, and match phases to investigate
patterns associated with MI's results.

## 🎯 Business Question

**What factors contributed to Mumbai Indians' poor results across the
IPL 2026 matches analysed, and which areas of performance need improvement?**

The analysis investigates:

- Team wins, losses, and win percentage
- Batting performance and player contributions
- Bowling performance and economy
- Powerplay, middle-over, and death-over performance
- Batting first versus chasing
- Toss decisions and match outcomes
- Opponent-wise performance
- Player-level contributions

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| PostgreSQL | Data exploration, aggregation, joins, CTEs, and window functions |
| Python and Pandas | Data cleaning, exploratory analysis, and performance analysis |
| Microsoft Excel | Calculations, summaries, and spreadsheet-based reporting |
| Power BI | Interactive dashboards and performance visualisation |

## 📂 Repository Structure

- `Python/` — Python analysis notebook
- `Excel/` — Excel analysis workbook
- `sql/` — SQL analysis files
- `powerbi/` — Power BI report and dashboard screenshots

See the folders above for the corresponding project deliverables.

## 📊 Power BI Dashboard

The dashboard contains three pages.

### 1. Team Performance Overview

Examines team KPIs, wins and losses by opponent, batting first versus
chasing, toss decisions, leading batters and bowlers, and match scores.

![MI Team Performance Dashboard](powerbi/screenshots/MI%20Performance%20Analysis%20-%20Dashboard.png)

### 2. Match and Phase Performance

Examines match scores, batting position, runs by match phase, wickets
lost by phase, and wickets taken by phase.

![MI Match and Phase Performance](powerbi/screenshots/MI%20Match%20%26%20Phase%20Performance%20Analysis.png)

### 3. Player Performance Analysis

Highlights leading batters by strike rate and runs, alongside leading
bowlers by wickets.

![MI Player Performance Analysis](powerbi/screenshots/MI%20Player%20Performance%20Analysis.png)

*If a screenshot does not display, verify its exact filename in the
`powerbi/screenshots/` folder and update the corresponding image path.*

## 📈 Initial Performance Summary

The current dashboard reports the following results for the seven
matches analysed:

| KPI | Result |
|---|---:|
| Matches analysed | 7 |
| Wins | 2 |
| Losses | 5 |
| Win percentage | 28.6% |

These figures describe the results represented in the current dashboard.
They do not, by themselves, establish the reasons for the losses.

## 🔍 Performance Investigation

The analysis investigates the following questions:

### Batting Performance
- How effectively did MI score runs?
- Which batters contributed most?
- How consistent were batting contributions?

### Bowling Performance
- How many wickets did MI take?
- How many runs did MI concede?
- Which bowlers contributed most to wicket-taking?

### Match Phase Performance
- How did MI perform in the powerplay?
- Did scoring and wicket-taking patterns change during the middle overs?
- How effectively did MI finish innings and bowl during the death overs?

### Match Situations
- How did results differ between batting first and chasing?
- What patterns appeared across wins and losses?
- Which performance factors warrant further investigation?

Final conclusions should be based on validated results from the existing
SQL, Python, Excel, and Power BI analyses.

## 📅 IPL 2025 Comparison

IPL 2025 data is not currently included in this project.

Therefore, this analysis does not claim to establish how MI's performance
changed between IPL 2025 and IPL 2026.

A year-over-year comparison can be added when comparable data from both
seasons becomes available.

## 💡 Skills Demonstrated

- SQL querying and data aggregation
- PostgreSQL CTEs and window functions
- Python and Pandas
- Exploratory Data Analysis
- Microsoft Excel
- Power BI dashboard development
- KPI analysis
- Data validation
- Performance analysis
- Data storytelling

## ⚠️ Data Scope and Limitations

- The current dashboard covers seven MI matches from IPL 2026.
- The findings should not be treated as a complete-season analysis unless
  dataset coverage has been verified.
- IPL 2025 data is not currently available in this project.
- Different filters, datasets, and calculation definitions may affect
  results across tools.
- Observed patterns do not necessarily establish causation.

## 🚀 Project Outcome

This project demonstrates an analytical workflow combining SQL, Python,
Excel, and Power BI to investigate cricket performance.

The objective is to evaluate MI's results, identify meaningful patterns
in batting, bowling, player contributions, and match phases, and present
the findings through interactive visualisation and analytical reporting.

---

**Project:** Mumbai Indians IPL 2026 Performance Analysis  
**Tools:** PostgreSQL, Python, Pandas, Microsoft Excel, Power BI  
**Focus:** Sports Analytics, Data Analysis, and Business Intelligence
