# COVID-19 Data Exploration Project
COVID-19 Project Overview

This project aimed to analyze COVID-19 data, focusing on key aspects such as infection rates, death percentages, and vaccination coverage across different countries and continents. The analysis explored various dimensions of the pandemic, including the relationship between total cases and deaths, infection rates relative to population, and trends in vaccination rollouts. The project also examined ICU admissions, hospitalization, and positivity rates to understand the healthcare strain caused by the virus.

This analysis was carried out using real-world COVID-19 data from publicly available databases (OWID), with the primary focus on:
1. Examining trends in confirmed infected cases;  identifying highest/lowest infected regions and comparing it per population
2. Examining the trends in death rates due to COVID-19; identifying highest/lowest deaths in regions and comparing it per population
3. Analyzing vaccination distribution and its impact on lowering infection rates.
4. Analyzing trends in hospitalization and impact based on previous health conditions.
5. Providing insights into healthcare resource management during the pandemic.

The dataset consisted of daily updates on COVID-19 infections, deaths, and vaccinations, structured into two tables: `covid_deaths`, and `covid_vaccinations`.

Dataset Structure

The dataset was organized into the following tables:
covid_deaths: Contains information on daily COVID-19 deaths and infection rates by country and region.
covid_vaccinations: Contains records of vaccination efforts, including the number of doses administered and the percentage of the population vaccinated.

Each table included columns for:
 Country/Region/Continent: The location where data was recorded.
 Date: The date of the recorded data.
 Confirmed Cases: The total number of confirmed COVID-19 cases on that date.
 Deaths: The total number of deaths caused by COVID-19.
 Vaccination Doses: The number of vaccine doses administered on that date.
 Vaccination Rate: The percentage of the population vaccinated.
 Infection Rates: Number of positive cases and their status on whether hospitalized or in ICU.
 Deaths related to various factors: Factors such as prior Cardiovascular issues.

 Techniques Used:
Joins: To combine COVID-19 cases and vaccination data.
Aggregate Functions: For calculating totals, averages, and percentages, such as infection rates and death percentages.
Common Table Expressions (CTEs): Used for breaking down complex queries, like calculating positivity rates and ICU admissions.
Window Functions: Implemented to analyze rolling vaccination numbers and calculate the percentage of vaccinated populations.
Views: Created for recurring queries, such as tracking vaccination progress.
Data Cleaning: Adjustments were made to ensure data accuracy, such as handling invalid dates and missing information.

 Insights Summary
 
  Deaths (Highest/Lowest Death Rates by Country and Continent):

- Highest Death Rates by Country:
- South America saw some of the highest death rates, especially in countries like Brazil, which had a significant death toll due to the high infection rate and overwhelmed healthcare systems. Brazil experienced a mortality rate of about 2.8% during peak pandemic waves.
- Europe also saw severe death tolls, with countries like Italy and UK having high cumulative deaths. The UK reported a death rate close to 1.8%.
- Egypt, an African country, had a higher death rate of around 5%, reflecting its healthcare challenges and late vaccination efforts.

- Lowest Death Rates by Country:
- Vanuatu in Oceania had one of the lowest global death rates at 0.12%, consistent with its isolated geography and effective early lockdowns.
- African countries such as Gabon reported low death rates of around 0.7%, and Zambia maintained a low mortality rate of 1.2%.
- Kenya's death rate stood at approximately 2.1%.

- Continental Insights:
- Africa consistently had lower death rates than most other continents, with some exceptions like Egypt due to healthcare challenges and delayed interventions.
- Europe and South America had some of the highest cumulative death counts and death rates. South America in particular faced severe impacts, driven by the high infection rates and healthcare system strain in countries like Brazil.
- Oceania recorded the lowest death toll globally due to smaller populations and stricter border control measures.

 Likelihood of Death (By Country):

- Highest Likelihood of Death:
- Egypt had a significant likelihood of death at 5%, one of the highest globally, likely due to limited medical infrastructure and fewer resources for advanced care.
- Afghanistan also had a relatively high death likelihood of 4.6%, compounded by its war-torn status and severely underfunded healthcare system.

- Median and Lower Likelihood of Death:
- Kenya recorded a death likelihood of 2.1%, indicating that it fared better than many other countries with similar infection rates, thanks to early government interventions and public health campaigns.
- Canada’s likelihood of death stood at 1.6%, reflecting the country’s effective healthcare response despite waves of infections.

- Regional Insights:
- Many countries in Europe, such as Slovakia (with a death likelihood of 3.1%), experienced higher death like-lihoods due to overwhelmed hospitals and aging populations.
- In contrast, countries like Gabon and Zambia in Africa saw much lower death rates and likelihoods of death, driven by proactive measures and younger populations.

 Highest Death Count by Continent:

- Most Affected Continents:
- South America recorded some of the highest death counts due to high infection rates in countries like Brazil and Peru. Brazil alone had over 600,000 deaths, making it one of the worst-hit countries globally.
- Europe, particularly Italy and the UK, reported similarly high death counts, with the UK surpassing 150,000 deaths during the pandemic.

- Least Affected Continents:
- Africa had one of the lowest cumulative death counts, although reporting issues may have skewed data in some regions. Zambia and Gabon recorded relatively low death tolls compared to global figures.
- Oceania maintained the lowest death counts due to its strong isolation strategies and small population size.

 Global Numbers:

- Total Global Deaths:
- The global COVID-19 death rate is estimated at 1.1%, with approximately 6.96 million confirmed deaths globally as of 2024. This represents around 1.1% of the total infected population worldwide.

 Weekly Admissions (By Country and Continent):

- Countries and Continents with the Highest Weekly Admissions:
- South America (particularly Brazil) and Europe (Italy, France, and Germany) consistently reported high hospital admissions. These countries faced overwhelming waves that filled hospitals and ICUs rapidly.

- ICU Admissions:
- Europe and North America saw the highest ICU admissions, driven by high infection rates and advanced medical facilities capable of handling severe cases. Countries like Italy had high ICU admission rates.
- On the lower end, Africa reported fewer ICU admissions. However, this was not necessarily due to lower severity but rather the lack of ICU facilities and medical infrastructure in many countries.

 Rolling Vaccinations (By Country and Continent):

- Highest Vaccination Rates:
- North America had one of the highest vaccination rates globally, with some countries reporting over 80-90% of their populations fully vaccinated.

- Median Vaccination Rates:
- Europe followed closely, with countries like Germany and France achieving vaccination rates above 70%, though vaccine hesitancy slowed progress in some areas.

- Lowest Vaccination Rates:
- Africa struggled with vaccine access early in the pandemic but improved its rates over time. The vaccination rate across Africa is estimated at 30%, with countries like Kenya having a vaccination rate close to 15%.
- Asia and South America also varied, with countries like India reaching over 65% vaccination, while South American countries like Brazil approached 75% full vaccination coverage.

 Cardiovascular-Related Deaths:

- Countries and Continents with the Highest Cardiovascular-Related Deaths:
- Europe saw a significant increase in cardiovascular-related deaths, particularly in older populations with pre-existing conditions. Countries like Italy and Spain had a notable rise in deaths due to cardiovascular complications, exacerbated by COVID-19.

- Countries with the Lowest Cardiovascular-Related Deaths:
- Africa reported lower cardiovascular-related deaths, partly due to younger populations and fewer lifestyle-related cardiovascular conditions. Kenya saw fewer cardiovascular deaths, but this was also due to underreporting in some regions.

- Impact on COVID-19 Deaths:
- Cardiovascular conditions had a substantial impact on COVID-19 deaths, particularly in regions like North America, Europe, and parts of South America. Pre-existing cardiovascular issues were significant, increasing the severity of infections.

   Recommendations

1. Increase Global Vaccine Distribution: Vaccination was a key factor in reducing both infection and death rates. Investment in global vaccine distribution programs should be prioritized in future pandemic preparedness.

2. Improve Healthcare Infrastructure: Regions with limited healthcare resources faced higher death rates during the pandemic. Strengthening healthcare systems in vulnerable areas can mitigate the impact of future health crises.

3. Early Intervention and Lockdowns: Countries that implemented early lockdowns and social distancing measures had lower infection and death rates. Prompt action during early pandemic stages is critical.

4. DataDriven Decision Making: Governments and healthcare institutions should leverage realtime data to make informed decisions on resource allocation, vaccination rollouts, and public health measures.
