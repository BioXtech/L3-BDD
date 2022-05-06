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

SELECT C.TITLE, C.THEME, R.START_DATE
FROM CONTENT C
JOIN Document_Borrower DB   ON DB.DocumentID = D.ID
JOIN Borrower B             ON B.ID = DB.BorrowerID
WHERE 
    B.name = 'Dupont' AND
    TO_DATE(DB.dateStart, 'DD/MM/YY') >= TO_DATE('15/11/18', 'DD/MM/YY') AND
    TO_DATE(DB.dateStart, 'DD/MM/YY') <= TO_DATE('15/11/19', 'DD/MM/YY');
	
-- ===== (3) ===== --



-- ===== (4) ===== --



-- ===== (5) ===== --



-- ===== (6) ===== --



-- ===== (7) ===== --



-- ===== (8) ===== --



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