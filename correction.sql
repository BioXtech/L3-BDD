    -- Correction n°1
UPDATE
    datanetflouze 
SET 
    datanetflouze.duration = datanetflouze.rating,
    datanetflouze.rating = NULL
WHERE rating <> 'TV-Y'
    AND rating <> 'TV-G'
    AND rating <> 'G'
    AND rating <> 'TV-Y7'
    AND rating <> 'PG'
    AND rating <> 'TV-Y7-FV'
    AND rating <> 'TV-PG'
    AND rating <> 'TV-14'
    AND rating <> 'PG-13'
    AND rating <> 'TV-MA'
    AND rating <> 'R'
    AND rating <> 'NC-17'
    AND rating <> 'NR'
    AND rating <> 'UR'
;

	-- Correction n°2
UPDATE
    datanetflouze
SET
    datanetflouze.country = SUBSTR(datanetflouze.country, 2)
WHERE
    SUBSTR(country, 0, 1) = ','
;