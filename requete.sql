-- ######################################################
-- #          Request.sql - Requêtes du sujet           #
-- #                                                    #
-- # Vincent JAMOTEAU, Simon KORTSMIT, Guillaume PORRO  #
-- ######################################################

-- ===== (1) ===== --

SELECT TITLE 
FROM CONTENT 
WHERE 
    THEME = 'Anime' OR 
    THEME = 'Fantasy'
ORDER BY TITLE;

-- ===== (2) ===== --

SELECT C.TITLE, C.THEME
FROM CONTENT C
JOIN RENTING R						ON R.CONTENT = C.CONTENT_ID
JOIN LINK_CUSTOMER_RENTING LCR   	ON LCR.RENT_ID = R.RENT_ID
JOIN CUSTOMER CU 					ON CU.CUSTOMER_ID = LCR.CUSTOMER_ID
WHERE 
    CU.LAST_NAME = 'Dupont' AND
    TO_DATE(R.START_DATE, 'MM/YY') >= TO_DATE('01/22', 'MM/YY') AND
    TO_DATE(R.START_DATE, 'MM/YY') <= TO_DATE('03/22', 'MM/YY');
	
-- ===== (3) ===== --


-- ===== (4) ===== --



-- ===== (5) ===== --



-- ===== (6) ===== --



-- ===== (7) ===== --

SELECT C.TITLE, COUNT(R.CONTENT) AS "NB RENTINGS"
FROM CONTENT C
JOIN RENTING R ON R.CONTENT = C.CONTENT_ID
GROUP BY C.TITLE;

-- ===== (8) ===== --

SELECT S.LAST_NAME
FROM SCRIPTWRITER S, CONTENT C
WHERE S.SCRIPTWRITER_ID = C.SCRIPTWRITER AND (C.PEGI_RATING = '16' or C.PEGI_RATING = '18')
GROUP BY S.LAST_NAME
HAVING COUNT(*) > 2;


-- ===== (9) ===== --



-- ===== (10) ===== --



-- ===== (11) ===== --



-- ===== (12) ===== --



-- ===== (13) ===== --



-- ===== (14) ===== --



-- ===== (15) ===== --



-- ===== (16) ===== --



-- ===== (17) ===== --



-- ===== (18) ===== --



-- ===== (19) ===== --



-- ===== (20) ===== --