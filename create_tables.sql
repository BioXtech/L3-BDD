-- SERIES PART OF THE DATABASE
CREATE TABLE SERIES_DIRECTOR(
  DIRECTOR_ID INTEGER,
  FIRST_NAME VARCHAR(100) NOT NULL,
  LAST_NAME VARCHAR(100) NOT NULL,
  CONSTRAINT PK_SERIES_DIRECTOR PRIMARY KEY(DIRECTOR_ID)
);

CREATE TABLE SEASON(
    SEASON_ID INTEGER,
    EPISODE_COUNT INTEGER NOT NULL,
    CUSTOMER_RATING FLOAT(2),
    CONSTRAINT PK_SEASON PRIMARY KEY(SEASON_ID)
);

CREATE TABLE ACTOR(
    ACTOR_ID INTEGER,
  FIRST_NAME VARCHAR(100) NOT NULL,
  LAST_NAME VARCHAR(100) NOT NULL,
  CONSTRAINT PK_ACTOR PRIMARY KEY(ACTOR_ID)
);

CREATE TABLE SERIES(
    SERIES_ID INTEGER,
    SEASON_NUMBER INTEGER NOT NULL,
    CONSTRAINT PK_SERIES PRIMARY KEY(SERIES_ID)
);

CREATE TABLE LINK_SERIES_DIRECTOR_SEASON(
    DIRECTOR_ID INTEGER NOT NULL,
    SEASON_ID INTEGER NOT NULL,
    CONSTRAINT PK_LINK_SERIES_DIRECTOR_SEASON PRIMARY KEY(DIRECTOR_ID, SEASON_ID),
    CONSTRAINT FK_DIRECTOR_SEASON FOREIGN KEY(DIRECTOR_ID) REFERENCES SERIES_DIRECTOR(DIRECTOR_ID),
    CONSTRAINT FK_DIRECTOR_SEASON_2 FOREIGN KEY(SEASON_ID) REFERENCES SEASON(SEASON_ID)
);

CREATE TABLE LINK_ACTOR_SEASON(
    ACTOR_ID INTEGER NOT NULL,
    SEASON_ID INTEGER NOT NULL,
    CONSTRAINT PK_LINK_ACTOR_SEASON PRIMARY KEY(ACTOR_ID, SEASON_ID),
    CONSTRAINT FK_ACTOR_SEASON FOREIGN KEY(ACTOR_ID) REFERENCES ACTOR(ACTOR_ID),
    CONSTRAINT FK_ACTOR_SEASON_2 FOREIGN KEY(SEASON_ID) REFERENCES SEASON(SEASON_ID)
);

CREATE TABLE LINK_SERIES_SEASON(
    SERIES_ID INTEGER NOT NULL,
    SEASON_ID INTEGER NOT NULL,
    CONSTRAINT PK_LINK_SERIES_SEASON PRIMARY KEY(SERIES_ID, SEASON_ID),
    CONSTRAINT FK_SERIES_SEASON FOREIGN KEY(SERIES_ID) REFERENCES SERIES(SERIES_ID),
    CONSTRAINT FK_SERIES_SEASON_2 FOREIGN KEY(SEASON_ID) REFERENCES SEASON(SEASON_ID)
);

-- MOVIES PART OF THE DATABASE
CREATE TABLE MOVIE(
    MOVIE_ID INTEGER,
    MOVIE_LENGTH NUMBER(4) NOT NULL,
    CONSTRAINT PK_MOVIE PRIMARY KEY(MOVIE_ID)
);

CREATE TABLE SCRIPTWRITER(
    SCRIPTWRITER_ID INTEGER,
    FIRST_NAME VARCHAR(100) NOT NULL,
    LAST_NAME VARCHAR(100) NOT NULL,
    CONSTRAINT PK_SCRIPTWRITER PRIMARY KEY(SCRIPTWRITER_ID)
);

CREATE TABLE LINK_ACTOR_MOVIE(
    ACTOR_ID INTEGER NOT NULL,
    MOVIE_ID INTEGER NOT NULL,
    CONSTRAINT PK_LINK_ACTOR_MOVIE PRIMARY KEY(ACTOR_ID, MOVIE_ID),
    CONSTRAINT FK_ACTOR_MOVIE FOREIGN KEY(ACTOR_ID) REFERENCES ACTOR(ACTOR_ID),
    CONSTRAINT FK_ACTOR_MOVIE_2 FOREIGN KEY(MOVIE_ID) REFERENCES MOVIE(MOVIE_ID)
);

CREATE TABLE LINK_SCRIPTWRITER_MOVIE(
    SCRIPTWRITER_ID INTEGER NOT NULL,
    MOVIE_ID INTEGER NOT NULL,
    CONSTRAINT PK_LINK_SCRIPTWRITER_MOVIE PRIMARY KEY(SCRIPTWRITER_ID, MOVIE_ID),
    CONSTRAINT FK_SCRIPTWRITER_MOVIE FOREIGN KEY(SCRIPTWRITER_ID) REFERENCES SCRIPTWRITER(SCRIPTWRITER_ID),
    CONSTRAINT FK_SCRIPTWRITER_MOVIE_2 FOREIGN KEY(MOVIE_ID) REFERENCES MOVIE(MOVIE_ID)
);

-- YOUTH PART OF THE DATABASE
CREATE TABLE COMPOSER(
    COMPOSER_ID INTEGER,
    FIRST_NAME VARCHAR(100) NOT NULL,
    LAST_NAME VARCHAR(100) NOT NULL,
    CONSTRAINT PK_COMPOSER PRIMARY KEY(COMPOSER_ID)
);

CREATE TABLE YOUTH(
    YOUTH_ID INTEGER,
    YOUTH_LENGTH NUMBER(4) NOT NULL,
    CONSTRAINT PK_YOUTH PRIMARY KEY(YOUTH_ID)
);

CREATE TABLE LINK_SCRIPTWRITER_YOUTH(
    SCRIPTWRITER_ID INTEGER NOT NULL,
    YOUTH_ID INTEGER NOT NULL,
    CONSTRAINT PK_LINK_SCRIPTWRITER_YOUTH PRIMARY KEY(SCRIPTWRITER_ID, YOUTH_ID),
    CONSTRAINT FK_SCRIPTWRITER_YOUTH FOREIGN KEY(SCRIPTWRITER_ID) REFERENCES SCRIPTWRITER(SCRIPTWRITER_ID),
    CONSTRAINT FK_SCRIPTWRITER_YOUTH_2 FOREIGN KEY(YOUTH_ID) REFERENCES YOUTH(YOUTH_ID)
);

CREATE TABLE LINK_COMPOSER_YOUTH(
    COMPOSER_ID INTEGER NOT NULL,
    YOUTH_ID INTEGER NOT NULL,
    CONSTRAINT PK_LINK_COMPOSER_YOUTH PRIMARY KEY(COMPOSER_ID, YOUTH_ID),
    CONSTRAINT FK_COMPOSER_YOUTH FOREIGN KEY(COMPOSER_ID) REFERENCES COMPOSER(COMPOSER_ID),
    CONSTRAINT FK_COMPOSER_YOUTH_2 FOREIGN KEY(YOUTH_ID) REFERENCES YOUTH(YOUTH_ID)
);

-- SHOWS PART OF THE DATABASE
CREATE TABLE SHOWS(
    SHOWS_ID INTEGER,
    SHOWS_LENGTH NUMBER(4) NOT NULL,
    CONSTRAINT PK_SHOWS PRIMARY KEY(SHOWS_ID)
);

CREATE TABLE SHOWS_DIRECTOR(
    DIRECTOR_ID INTEGER,
    FIRST_NAME VARCHAR(100) NOT NULL,
    LAST_NAME VARCHAR(100) NOT NULL,
    CONSTRAINT PK_SHOWS_DIRECTOR PRIMARY KEY(DIRECTOR_ID)
);

CREATE TABLE PERFORMER(
    PERFORMER_ID INTEGER,
    FIRST_NAME VARCHAR(100) NOT NULL,
    LAST_NAME VARCHAR(100) NOT NULL,
    CONSTRAINT PK_PERFORMER PRIMARY KEY(PERFORMER_ID)
);

CREATE TABLE LINK_SCRIPTWRITER_SHOWS(
    SCRIPTWRITER_ID INTEGER NOT NULL,
    SHOWS_ID INTEGER NOT NULL,
    CONSTRAINT PK_LINK_SCRIPTWRITER_SHOWS PRIMARY KEY(SCRIPTWRITER_ID, SHOWS_ID),
    CONSTRAINT FK_SCRIPTWRITER_SHOWS FOREIGN KEY(SCRIPTWRITER_ID) REFERENCES SCRIPTWRITER(SCRIPTWRITER_ID),
    CONSTRAINT FK_SCRIPTWRITER_SHOWS_2 FOREIGN KEY(SHOWS_ID) REFERENCES SHOWS(SHOWS_ID)
);

CREATE TABLE LINK_SHOWS_DIRECTOR_SHOWS(
    DIRECTOR_ID INTEGER NOT NULL,
    SHOWS_ID INTEGER NOT NULL,
    CONSTRAINT PK_LINK_SHOWS_DIRECTOR_SHOWS PRIMARY KEY(DIRECTOR_ID, SHOWS_ID),
    CONSTRAINT FK_SHOWS_DIRECTOR_SHOWS FOREIGN KEY(DIRECTOR_ID) REFERENCES SHOWS_DIRECTOR(DIRECTOR_ID),
    CONSTRAINT FK_SHOWS_DIRECTOR_SHOWS_2 FOREIGN KEY(SHOWS_ID) REFERENCES SHOWS(SHOWS_ID)
);

CREATE TABLE LINK_PERFORMER_SHOWS(
    PERFORMER_ID INTEGER NOT NULL,
    SHOWS_ID INTEGER NOT NULL,
    CONSTRAINT PK_LINK_PERFORMER_SHOWS PRIMARY KEY(PERFORMER_ID, SHOWS_ID),
    CONSTRAINT FK_PERFORMER_SHOWS FOREIGN KEY(PERFORMER_ID) REFERENCES PERFORMER(PERFORMER_ID),
    CONSTRAINT FK_PERFORMER_SHOWS_2 FOREIGN KEY(SHOWS_ID) REFERENCES SHOWS(SHOWS_ID)
);


-- CUSTOMER AND SUBSCRIPTION PART
CREATE TABLE SUBSCRIPTION_TYPES(
	SUBSCRIPTION_TYPES_ID INTEGER,
	SUBSCRIPTION_NAME CHAR(7) NOT NULL,
	MAX_MOVIES INTEGER NOT NULL,
	MAX_SERIES INTEGER NOT NULL,
	MAX_YOUTH INTEGER NOT NULL,
	MAX_SHOWS INTEGER NOT NULL,
	COST_PER_MONTH FLOAT(2) NOT NULL,
	CONSTRAINT PK_SUBSCRIPTION_TYPES PRIMARY KEY(SUBSCRIPTION_TYPES_ID)
);

CREATE TABLE CUSTOMER(
	CUSTOMER_ID INTEGER,
	FIRST_NAME VARCHAR(100) NOT NULL,
	LAST_NAME VARCHAR(100) NOT NULL,
	POSTAL_ADRESS VARCHAR(100) NOT NULL,
	MAIL_ADRESS VARCHAR(100) NOT NULL,
	PHONE_NUMBER VARCHAR(100) NOT NULL,
	PASSWD VARCHAR(100) NOT NULL,
	CONSTRAINT PK_CUSTOMER PRIMARY KEY(CUSTOMER_ID)
);

CREATE TABLE SUBSCRIPTION(
	SUBSCRIPTION_ID INTEGER,
	START_DATE DATE NOT NULL,
	END_DATE DATE NOT NULL,
	SUBSCRIPTION_TYPES INTEGER NOT NULL,
	CUSTOMER_ID INTEGER NOT NULL,
	CONSTRAINT PK_SUBSCRIPTION PRIMARY KEY(SUBSCRIPTION_ID),
	CONSTRAINT FK_SUBSCRIPTION_SUBSCRIPTION_TYPES FOREIGN KEY(SUBSCRIPTION_TYPES) REFERENCES SUBSCRIPTION_TYPES(SUBSCRIPTION_TYPES_ID),
	CONSTRAINT FK_SUBSCRIPTION_CUSTOMER FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)
);

-- VIDEO FORMAT PART OF THE DATABASE

CREATE TABLE EXTENSION(
	EXTENSION_ID INTEGER,
	EXTENSION_NAME VARCHAR(100) NOT NULL,
	CONSTRAINT PK_EXTENSION PRIMARY KEY(EXTENSION_ID)
);
CREATE TABLE MIME(
	MIME_ID INTEGER,
	MIME_NAME VARCHAR(100) NOT NULL,
	CONSTRAINT PK_MIME PRIMARY KEY(MIME_ID)
);
CREATE TABLE SOFTWARE(
	SOFTWARE_ID INTEGER,
	SOFTWARE_NAME VARCHAR(100) NOT NULL,
	CONSTRAINT PK_SOFTWARE PRIMARY KEY(SOFTWARE_ID)
);

CREATE TABLE VIDEO_FORMAT(
	VIDEO_FORMAT_ID INTEGER,
	EXTENSION_ID INTEGER NOT NULL ,
	MIME_ID INTEGER NOT NULL ,
	SOFTWARE_ID INTEGER NOT NULL ,
	NAME_VIDEO_FORMAT VARCHAR(100) NOT NULL,
	CONSTRAINT PK_VIDEO_FORMAT PRIMARY KEY(VIDEO_FORMAT_ID),
	CONSTRAINT FK_VIDEO_FORMAT_EXTENSION FOREIGN KEY(EXTENSION_ID) REFERENCES EXTENSION(EXTENSION_ID),
	CONSTRAINT FK_VIDEO_FORMAT_MIME FOREIGN KEY(MIME_ID) REFERENCES MIME(MIME_ID),
	CONSTRAINT FK_VIDEO_FORMAT_SOFTWARE FOREIGN KEY(SOFTWARE_ID) REFERENCES SOFTWARE(SOFTWARE_ID)	
);

-- RENTING/PURCHASE PART OF THE DATABASE

CREATE TABLE RENTING(
	RENT_ID INTEGER,
	CONTENT INTEGER NOT NULL,
	STREAM_LINK VARCHAR(100) NOT NULL,
	VIDEO_QUALITY VARCHAR(100) NOT NULL,
	PRICE FLOAT(2) NOT NULL,
	START_DATE DATE NOT NULL,
	END_DATE DATE NOT NULL,
	CONSTRAINT PK_RENTING PRIMARY KEY(RENT_ID)
);

CREATE TABLE LINK_CUSTOMER_RENTING(
	CUSTOMER_ID INTEGER NOT NULL,
	RENT_ID INTEGER NOT NULL,
	CONSTRAINT PK_LINK_CUSTOMER_RENTING PRIMARY KEY(CUSTOMER_ID, RENT_ID),
	CONSTRAINT FK_LINK_CUSTOMER_RENTING FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
	CONSTRAINT FK_LINK_CUSTOMER_RENTING_2 FOREIGN KEY(RENT_ID) REFERENCES RENTING(RENT_ID)
);

CREATE TABLE PURCHASE(
	PURCHASE_ID INTEGER,
	VIDEO_QUALITY VARCHAR(100) NOT NULL,
	PRICE FLOAT(2) NOT NULL,
	DATE_PURCHASE DATE NOT NULL,
	VIDEO_FORMAT INTEGER NOT NULL,
	CONSTRAINT PK_PURCHASE PRIMARY KEY(PURCHASE_ID),
	CONSTRAINT FK_PURCHASE_FORMAT FOREIGN KEY(VIDEO_FORMAT) REFERENCES VIDEO_FORMAT(VIDEO_FORMAT_ID)
);

CREATE TABLE LINK_CUSTOMER_PURCHASE(
	CUSTOMER_ID INTEGER NOT NULL,
	PURCHASE_ID INTEGER NOT NULL,
	CONSTRAINT PK_LINK_CUSTOMER_PURCHASE PRIMARY KEY(CUSTOMER_ID, PURCHASE_ID),
	CONSTRAINT FK_LINK_CUSTOMER_PURCHASE FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
	CONSTRAINT FK_LINK_CUSTOMER_PURCHASE_2 FOREIGN KEY(PURCHASE_ID) REFERENCES PURCHASE(PURCHASE_ID)
);



-- PEGI RATING PART OF THE DATABASE

CREATE TABLE PEGI_RATING(
	PEGI_RATING_ID INTEGER,
	RATING INTEGER NOT NULL,
	CONSTRAINT PK_PEGI_RATING PRIMARY KEY(PEGI_RATING_ID)
);

-- CONTENT PART OF THE DATABASE

CREATE TABLE CONTENT(
	CONTENT_ID INTEGER,
	SERIES_ID INTEGER,
	MOVIE_ID INTEGER,
	YOUTH_ID INTEGER,
	SHOWS_ID INTEGER,
	TITLE VARCHAR(100) NOT NULL,
	DESCRIPTION VARCHAR(100) NOT NULL,
	THEME VARCHAR(100) NOT NULL,
	KEYWORDS VARCHAR(100) NOT NULL,
	CONTENT_DIRECTOR VARCHAR(100) NOT NULL,
	TRAILER_LINK VARCHAR(100) NOT NULL,
	PEGI_RATING INTEGER NOT NULL,
	COUNTRY VARCHAR(100) NOT NULL,
	PRODUCTION_YEAR NUMBER(4),
	CONSTRAINT PK_CONTENT PRIMARY KEY(CONTENT_ID),
	CONSTRAINT PK_CONTENT_SERIES FOREIGN KEY(SERIES_ID) REFERENCES SERIES(SERIES_ID),
	CONSTRAINT PK_CONTENT_MOVIE FOREIGN KEY(MOVIE_ID) REFERENCES MOVIE(MOVIE_ID),
	CONSTRAINT PK_CONTENT_YOUTH FOREIGN KEY(YOUTH_ID) REFERENCES YOUTH(YOUTH_ID),
	CONSTRAINT PK_CONTENT_SHOWS FOREIGN KEY(SHOWS_ID) REFERENCES SHOWS(SHOWS_ID)
);

-- CUSTOMER RATING PART OF THE DATABASE

CREATE TABLE CUSTOMER_RATING(
	CUSTOMER_ID INTEGER NOT NULL,
	CONTENT_ID INTEGER NOT NULL,
	RATING_VALUE FLOAT(2) NOT NULL,
	CONSTRAINT PK_CUSTOMER_RATING PRIMARY KEY(CUSTOMER_ID, CONTENT_ID),
	CONSTRAINT FK_CUSTOMER_RATING_CUSTOMER FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
	CONSTRAINT FK_CUSTOMER_RATING_CONTENT FOREIGN KEY(CONTENT_ID) REFERENCES CONTENT(CONTENT_ID)
);

ALTER TABLE RENTING ADD CONSTRAINT FK_RENTING_CONTENT FOREIGN KEY(CONTENT) REFERENCES CONTENT(CONTENT_ID);
