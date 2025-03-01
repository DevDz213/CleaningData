-- DATA CLEANING
SELECT *
FROM layoffs;

-- 1. Remove duplicates
CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *
FROM layoffs_staging;
INSERT layoffs_staging
SELECT *
FROM layoffs;

-- 2. Standardize the data

-- 3. Null Values or Blank

-- 4. Remove any column