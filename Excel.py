# Combine the clan dataset and the solution sheet into a single Excel workbook

from openpyxl import Workbook
from datetime import datetime, timedelta
import random

# ---- Create workbook ----
wb = Workbook()

# ---- Sheet 1: Clan Data ----
ws_data = wb.active
ws_data.title = "Clan_Data"

headers = ["Clan Name", "Member Count", "Founding Date", "Recent Activity (Days Ago)"]
ws_data.append(headers)

clan_names = [
    "Iron Wolves", "Shadow Phoenix", "Golden Spears", "Crimson Blades", "Storm Raiders",
    "Silent Hunters", "Emerald Legion", "Night Owls", "Silver Falcons", "Thunder Tribe",
    "Azure Dragons", "Frost Giants", "Savage Lions", "Obsidian Guard", "Radiant Kings",
    "Wild Nomads", "Dark Horizon", "Iron Titans", "Burning Arrows", "Mystic Wolves",
    "Ghost Riders", "Blue Sentinels", "Copper Shields", "Diamond Circle", "Elite Vanguard",
    "Firestorm Clan", "Glacier Guild", "Hidden Daggers", "Ivory Knights", "Jade Warriors",
    "King's Order", "Lunar Pact", "Mountain Wardens", "Nova Alliance", "Omega Legion",
    "Phantom Pact", "Quartz Syndicate", "Royal Blades", "Solar Dominion", "Titan Forge",
    "Unity Clan", "Vortex Squad", "Warborn Tribe", "Xenon Circle", "Young Guardians",
    "Zenith Order", "Alpha Raiders", "Blaze Battalion", "Cobalt Crew", "Dragon Pact"
]

start_date = datetime(2015, 1, 1)

for name in clan_names:
    member_count = random.randint(5, 150)
    founding_date = start_date + timedelta(days=random.randint(0, 3650))
    recent_activity = random.randint(0, 60)
    ws_data.append([name, member_count, founding_date.strftime("%Y-%m-%d"), recent_activity])

# ---- Sheet 2: Solution Sheet ----
ws_sol = wb.create_sheet(title="Your_Solutions")

headers_sol = ["Question", "Formula Used", "Your Answer / Result", "Comments"]
ws_sol.append(headers_sol)

questions = [
"1. Count how many clans are listed in the dataset.",
"2. Calculate the total number of members across all clans.",
"3. Calculate the average member count.",
"4. Find the clan with the highest member count.",
"5. Find the clan with the lowest member count.",
"6. Count how many clans have more than 100 members.",
"7. Count how many clans have recent activity within the last 7 days.",
"8. Create a formula to calculate Clan Age (Years) from the founding date.",
"9. Write the formula used to classify Activity Status (Active / Moderate / Inactive).",
"10. Count how many clans fall into each Activity Status category.",
"11. Find the average member count for active clans only.",
"12. Identify clans founded before 2020.",
"13. Count clans founded after 2022.",
"14. Create a pivot table summarizing Activity Status and total members.",
"15. Write the formula used to rank clans by member count.",
"16. Write the formula used to classify clans as Large / Medium / Small.",
"17. Calculate the average clan age.",
"18. Identify the top 5 clans with the most members.",
"19. Calculate the percentage of inactive clans.",
"20. Create summary metrics: Total clans, Total members, Active clans, Average clan age."
]

for q in questions:
    ws_sol.append([q, "", "", ""])

file_path = "/mnt/data/excel_clan_practice_workbook.xlsx"
wb.save(file_path)

file_path