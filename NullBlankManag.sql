-- 3.GERER NULL ET BLANK

SELECT * 
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- CATCH LES COMPANIES SANS INDUSTRIE ET VOIR SI Y'A LA MEME COMPANIE AVEC UNE INDUSTRIE POUR COPIER
SELECT *
FROM layoffs_staging2
WHERE industry IS NULL 
OR industry = '';

SELECT *
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
    AND t1.location = t2.location
WHERE (t1.industry IS NULL OR t1.industry = '') 
;

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE (t1.industry IS NULL OR t1.industry = '') AND (t2.industry IS NOT NULL AND t2.industry != '')
;

SELECT *
FROM layoffs_staging2
WHERE company IS NULL 
OR company LIKE 'Bally%';

-- bally est solo sans industrie

SELECT * 
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- 4.DROP UNE COLONNE
ALTER TABLE layoffs_staging2
DROP COLUMN row_num;



    
