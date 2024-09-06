/*
Covid-19 Data Exploration

Skills used in this Project : Joins, Aggregate functions, Windows functions, CTEs,  Creating Views

*/
-- Creating a database to work with 

CREATE DATABASE Covidproject;

USE Covidproject;

-- Creating Tables in which data will be imported into

CREATE TABLE CovidDeaths (
iso_code varchar(255),
continent varchar (255),
location  varchar (255),
date date,
population float,
total_cases float,
new_cases int,
new_cases_smoothed float,
total_deaths int,
new_deaths int,
new_deaths_smoothed float,
total_cases_per_million float,
new_cases_per_million float,
new_cases_smoothed_per_million float,
total_deaths_per_million float, 
new_deaths_per_million float,
new_deaths_smoothed_per_million float,
reproduction_rate float,
icu_patients int,
icu_patients_per_million float,
hosp_patients int,
hosp_patients_per_million float, 
weekly_icu_admissions int,
weekly_icu_admissions_per_million float,
weekly_hosp_admissions int,
weekly_hosp_admissions_per_million float
);

SELECT *
FROM coviddeaths;

-- Importing the data

SHOW VARIABLES LIKE 'secure_file_priv';

SHOW VARIABLES LIKE 'local_infile';

SET Global local_infile = 1;

LOAD DATA LOCAL INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CovidDeaths.csv"
INTO TABLE CovidDeaths
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT * 
FROM CovidDeaths;

CREATE TABLE CovidVaccinations(
iso_code varchar(255),
continent varchar (255),
location  varchar (255),
date date,
population float,
total_tests	int,
new_tests int,
total_tests_per_thousand float,
new_tests_per_thousand float,
new_tests_smoothed int,
new_tests_smoothed_per_thousand float,
positive_rate float,
tests_per_case float,
tests_units varchar(255),
total_vaccinations int,
people_vaccinated int,
people_fully_vaccinated int,
total_boosters int,
new_vaccinations int,
new_vaccinations_smoothed int,
total_vaccinations_per_hundred float,
people_vaccinated_per_hundred float,
people_fully_vaccinated_per_hundred float,
total_boosters_per_hundred float,
new_vaccinations_smoothed_per_million int,
new_people_vaccinated_smoothed	int,
new_people_vaccinated_smoothed_per_hundred	float,
stringency_index float,
population_density float,
median_age	float,
aged_65_older float,
aged_70_older float,
gdp_per_capita float,
extreme_poverty float,
cardiovasc_death_rate float,
diabetes_prevalence float,
female_smokers float,
male_smokers float,
handwashing_facilities float,
hospital_beds_per_thousand float,
life_expectancy float,
human_development_index float,
excess_mortality_cumulative_absolute float,
excess_mortality_cumulative float,
excess_mortality float,
excess_mortality_cumulative_per_million float
);

LOAD DATA LOCAL INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CovidVaccinations.csv"
INTO TABLE CovidVaccinations
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT *
FROM CovidVaccinations;

-- Making adjustsments in dataset to allow accurate exploration

ALTER TABLE coviddeaths MODIFY COLUMN date DATE NULL;
DELETE FROM coviddeaths
WHERE date < '1000-01-01' OR date > CURRENT_DATE() OR date IS NULL;

LOAD DATA LOCAL INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CovidDeaths2.csv"
INTO TABLE CovidDeaths
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT *
FROM coviddeaths;

-- Selecting the data that I will be working with

SELECT location,date, total_cases, new_cases, total_deaths, population
FROM CovidDeaths
ORDER BY location, date;

-- Total Cases Vs Total Deaths
-- Percentage of Total Deaths from total_cases

SELECT location,date, total_cases, total_deaths, (total_deaths / total_cases) *100 AS Percentage_Deaths
FROM CovidDeaths
ORDER BY location, date;

-- Likelihood of death per location

SELECT location,date, total_cases, total_deaths, (total_deaths / total_cases) *100 AS Percentage_Deaths
FROM CovidDeaths
WHERE location like '%Africa%'
ORDER BY location, date;

-- TotaL_cases VS Population
-- Percentage of Population that got infected with Covid-19

SELECT location,date, total_cases, population, (total_cases/ population) *100 AS PercentageInfected
FROM CovidDeaths
--	WHERE location like '%France%'
ORDER BY location, date;

-- Countries with Highest Infection rate per population

SELECT location, MAX(Total_Cases) AS HighestInfectionCount,population, MAX((total_cases/population))*100 AS PercentagePopulationInfected
FROM CovidDeaths
--	WHERE location like '%Kenya%'
GROUP BY location, population
ORDER BY PercentagePopulationInfected desc;
	
-- 	Countries with Highest Death Count per Population

SELECT location, MAX(Total_deaths)	AS HighestDeathCount,population, MAX((total_Deaths/population))*100 AS PercentageDeathPerPopulation
FROM CovidDeaths
--	WHERE location like '%states%'
WHERE Continent is not NULL
GROUP BY location, population
ORDER BY	HighestDeathCount	desc;

-- Continents with HighestDeathCount

SELECT continent,	MAX(Total_deaths)	AS HighestDeathCount
FROM CovidDeaths
--	WHERE location like '%Africa%'
WHERE Continent is not NULL
GROUP BY continent
ORDER BY	HighestDeathCount	desc;

-- Continent with Highest Death Count per population

SELECT continent,MAX(Total_deaths)	AS HighestDeathCount, MAX((total_Deaths/population))*100 AS PercentageDeathPerPopulation
FROM CovidDeaths
--	WHERE location like '%Africa%'
WHERE Continent is not NULL
GROUP BY continent
ORDER BY	HighestDeathCount	desc;

-- Percentage of Patients admitted weekly out of total Population

SELECT location, date, MAX(weekly_hosp_admissions) AS Weekly_HospAdmissions,Population, MAX((weekly_hosp_admissions/ population)) *100 AS PercentPopulationAdmiited
FROM coviddeaths
WHERE Continent is not null
GROUP BY location, date, Population
Order by Weekly_HospAdmissions desc;

-- GLOBAL NUMBERS
-- Total Cases and Total Deaths

SELECT SUM(New_cases) as Total_Cases, SUM(New_deaths) as Total_Deaths, SUM(New_deaths)/SUM(New_cases) *100 as TotalDeathPercentage
FROM CovidDeaths
WHERE Continent is not NULL;

SELECT	date,SUM(New_cases) as Total_Cases, SUM(New_deaths) as Total_Deaths, SUM(New_deaths)/SUM(New_cases) *100 as TotalDeathPercentage
FROM CovidDeaths
WHERE Continent is not NULL
GROUP BY Date
ORDER BY Date;

-- Percentage of ICU Patients from those Hospitalized
-- CTE

WITH PatientsStats (continent,location, date, Total_icu_patients, Total_HospitalizedPatients)
AS
(
SELECT continent,location, date, MAX(icu_patients) As Total_icu_patients, MAX(hosp_patients) AS Total_HospitalizedPatients
FROM CovidDeaths
Where Continent is not null
Group by	continent,location, date
)
SELECT *, (Total_icu_patients/Total_HospitalizedPatients)*100 AS PercentICUPatientsHospitalized
FROM PatientsStats
Order by continent,location, date;

-- Percentage of Positivity rates per population
-- CTE

WITH PositivityRate (continent, location, date, Population, Total_Tests,Total_PositivityRate)
AS
(
SELECT continent, location, date, MAX(Population) AS  Population, SUM(new_tests) as Total_Tests, MAX(positive_rate) AS Total_PositivityRate
FROM covidvaccinations
where Continent is not null
Group by continent, location, date
)
Select *,  Total_PositivityRate * 100 AS PercentPositiveTests
FROM PositivityRate
WHERE Total_Tests >0
Order by PercentPositiveTests desc;


-- Total Population vs Vaccinations
-- Joins

SELECT *
FROM CovidDeaths cd
JOIN CovidVaccinations cv
ON cd.location = cv.location
and cd.date =cv.date;

-- Windows Function
-- Showing numbers of Rolling Vaccinations per location

SELECT cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations,
SUM(cv.new_vaccinations)	OVER	(Partition By	cd.location	Order by cd.location,cd.date) As RollingVaccinations
FROM CovidDeaths cd
JOIN CovidVaccinations cv
ON cd.location = cv.location
and cd.date =cv.date
where	cd.continent is not null
order by continent, location, date;

-- CTE using Partition By
-- Percentage of Population vaccinated based of Rolling Vaccination Numbers

WITH PercentPopVaccinated (Continent, location, date, population, new_vaccinations, RollingVaccinations)
 AS (
SELECT cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations,
SUM(cv.new_vaccinations)	OVER	(Partition By	cd.location	Order by cd.location,cd.date) As RollingVaccinations
FROM CovidDeaths cd
JOIN CovidVaccinations cv
ON cd.location = cv.location
and cd.date =cv.date
where	cd.continent is not null
)
SELECT *,(RollingVaccinations/ Population)*100 AS Percent_Vac
FROM PercentPopVaccinated
Order by Location, date;

-- Views
-- View of Percentage Population vaccinated based of Rolling Vaccination Numbers

CREATE View PercentPopVaccinated As
SELECT cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations,
SUM(cv.new_vaccinations)	OVER	(Partition By	cd.location	Order by cd.location,cd.date) As RollingVaccinations
FROM CovidDeaths cd
JOIN CovidVaccinations cv
ON cd.location = cv.location
and cd.date =cv.date
where	cd.continent is not null;


-- Percentage of Positivity rates per population
-- CTE

WITH PositivityRate (continent, location, date, Population, Total_Tests,Total_PositivityRate)
AS
(
SELECT continent, location, date, MAX(Population) AS  Population, SUM(new_tests) as Total_Tests, MAX(positive_rate) AS Total_PositivityRate
FROM covidvaccinations
where Continent is not null
Group by continent, location, date
)
Select *,  Total_PositivityRate * 100 AS PercentPositiveTests
FROM PositivityRate
WHERE Total_Tests >0
Order by PercentPositiveTests desc;

-- Percentage of Deaths related to Cardiovascular related issues per loaction

SELECT Continent, location, date, cardiovasc_death_rate, Population, (cardiovasc_death_rate / Population) *100 AS PercentCardiovascularRelatedDeaths
FROM covidvaccinations
Where Continent is not null
Order by PercentCardiovascularRelatedDeaths desc;


