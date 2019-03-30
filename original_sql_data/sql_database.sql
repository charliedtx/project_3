USE lahman2016;


--  Transformation of the Data
-- First I need to eliminate data from 1880 to 1980 to optimize for performance and rid of unneccesary data. I am only looking post 1980
DELETE FROM AllstarFull WHERE yearID < 1980;
DELETE FROM appearances WHERE yearID < 1980;
DELETE FROM awardsmanagers WHERE yearID < 1980;
DELETE FROM awardsplayers WHERE yearID < 1980;
DELETE FROM awardssharemanagers WHERE yearID < 1980;
DELETE FROM awardsshareplayers WHERE yearID < 1980;
DELETE FROM Batting WHERE yearID < 1980;
DELETE FROM battingpost WHERE yearID < 1980;
DELETE FROM collegeplaying WHERE yearID < 1980;
DELETE FROM fielding WHERE yearID < 1980;
DELETE FROM fieldingof WHERE yearID < 1980;
DELETE FROM fieldingofsplit WHERE yearID < 1980;
DELETE FROM fieldingpost WHERE yearID < 1980;
DELETE FROM halloffame WHERE yearID < 1980;
DELETE FROM managers WHERE yearID < 1980;
DELETE FROM managershalf WHERE yearID < 1980;
DELETE FROM pitching WHERE yearID < 1980;
DELETE FROM pitchingpost WHERE yearID < 1980;
DELETE FROM salaries WHERE yearID < 1980;
DELETE FROM seriespost WHERE yearID < 1980;
DELETE FROM teams WHERE yearID < 1980;
DELETE FROM teamshalf WHERE yearID < 1980;
-- homegames table used year.key instead of year.id;
DELETE FROM homegames WHERE `year.key` < 1980;


-- Identify that playerID is the common across different tables to use as an ID
SELECT * FROM Batting WHERE yearID = 1990;
SELECT * FROM fielding WHERE yearID = 1990;


-- Displays the playerID and the nameGiven. nameGiven is the same as the first dound draft pick information I have from the csv downloaded and will be used to transform the data to analyse.
SELECT * FROM master;


-- I imported the csv of the first overall draft pick names from 1965 to present with the data import wizard after I created the Table.
CREATE TABLE `lahman2016`.`firstpicknames` (
  `ID` INT NOT NULL,
  `FIRST` VARCHAR(45) NULL,
  `Last` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`));
  
-- I need to clean the new table from players who made their MLB debut before 1980 and havent made their debut yet (players with none or incomplete data in the SQL database)
SELECT * FROM firstpicknames;
DELETE FROM firstpicknames WHERE ID > 40;

-- Brien Taylor and Mark Appel were first overall picks who neverplayed in a MLB game, thus no data in the SQL server
DELETE FROM firstpicknames WHERE Last = "Taylor";
DELETE FROM firstpicknames WHERE Last = "Appel";

-- Casey Mize, Royce Lewis, Mickey Moniak, and Brady Aiken have not made their major league debuts yet, thus there is no data in the database for them
DELETE FROM firstpicknames WHERE ID IN (1,2,3,4,5);
SELECT* FROM firstpicknames;


-- The players data is all catorgorized by the column playerID. I now must get the playerID for all of the first overall draft picks with MLB experience since 1980. Getting the playerID that is used throughout the SQL Database will enable clearer analysis of those specific players performance.
SELECT playerID, nameFirst, nameLast, debut FROM master;

-- First round draft pick player ids ('correca01','colege01','harpebr03','strasst01','beckhti01','priceda01','hochelu01','uptonju01','bushma01','youngde03','bullibr01','mauerjo01','gonzaad01','hamiljo03','burrepa01','anderma01','erstada01','wilsopa02','rodrial01','nevinph01','jonesch06','mcdonbe01','benesan01','griffke02','kingje01','surhobj01','abnersh01','belchti01','dunstsh01','mooremi01','strawda01','chambal01')


-- final tables
SELECT * 
FROM allstarfull
WHERE playerID IN ('correca01','colege01','harpebr03','strasst01','beckhti01','priceda01','hochelu01','uptonju01','bushma01','youngde03','bullibr01','mauerjo01','gonzaad01','hamiljo03','burrepa01','anderma01','erstada01','wilsopa02','rodrial01','nevinph01','jonesch06','mcdonbe01','benesan01','griffke02','kingje01','surhobj01','abnersh01','belchti01','dunstsh01','mooremi01','strawda01','chambal01')
ORDER BY playerID;

SELECT * 
FROM appearances
WHERE playerID IN ('correca01','colege01','harpebr03','strasst01','beckhti01','priceda01','hochelu01','uptonju01','bushma01','youngde03','bullibr01','mauerjo01','gonzaad01','hamiljo03','burrepa01','anderma01','erstada01','wilsopa02','rodrial01','nevinph01','jonesch06','mcdonbe01','benesan01','griffke02','kingje01','surhobj01','abnersh01','belchti01','dunstsh01','mooremi01','strawda01','chambal01')
ORDER BY playerID;

SELECT * 
FROM awardsplayers
WHERE playerID IN ('correca01','colege01','harpebr03','strasst01','beckhti01','priceda01','hochelu01','uptonju01','bushma01','youngde03','bullibr01','mauerjo01','gonzaad01','hamiljo03','burrepa01','anderma01','erstada01','wilsopa02','rodrial01','nevinph01','jonesch06','mcdonbe01','benesan01','griffke02','kingje01','surhobj01','abnersh01','belchti01','dunstsh01','mooremi01','strawda01','chambal01')
ORDER BY playerID;

SELECT * 
FROM batting
WHERE playerID IN ('correca01','colege01','harpebr03','strasst01','beckhti01','priceda01','hochelu01','uptonju01','bushma01','youngde03','bullibr01','mauerjo01','gonzaad01','hamiljo03','burrepa01','anderma01','erstada01','wilsopa02','rodrial01','nevinph01','jonesch06','mcdonbe01','benesan01','griffke02','kingje01','surhobj01','abnersh01','belchti01','dunstsh01','mooremi01','strawda01','chambal01')
ORDER BY playerID;

SELECT * 
FROM fielding
WHERE playerID IN ('correca01','colege01','harpebr03','strasst01','beckhti01','priceda01','hochelu01','uptonju01','bushma01','youngde03','bullibr01','mauerjo01','gonzaad01','hamiljo03','burrepa01','anderma01','erstada01','wilsopa02','rodrial01','nevinph01','jonesch06','mcdonbe01','benesan01','griffke02','kingje01','surhobj01','abnersh01','belchti01','dunstsh01','mooremi01','strawda01','chambal01')
ORDER BY playerID;

SELECT * 
FROM pitching
WHERE playerID IN ('correca01','colege01','harpebr03','strasst01','beckhti01','priceda01','hochelu01','uptonju01','bushma01','youngde03','bullibr01','mauerjo01','gonzaad01','hamiljo03','burrepa01','anderma01','erstada01','wilsopa02','rodrial01','nevinph01','jonesch06','mcdonbe01','benesan01','griffke02','kingje01','surhobj01','abnersh01','belchti01','dunstsh01','mooremi01','strawda01','chambal01')
ORDER BY playerID;

SELECT * 
FROM halloffame
WHERE playerID IN ('correca01','colege01','harpebr03','strasst01','beckhti01','priceda01','hochelu01','uptonju01','bushma01','youngde03','bullibr01','mauerjo01','gonzaad01','hamiljo03','burrepa01','anderma01','erstada01','wilsopa02','rodrial01','nevinph01','jonesch06','mcdonbe01','benesan01','griffke02','kingje01','surhobj01','abnersh01','belchti01','dunstsh01','mooremi01','strawda01','chambal01')
ORDER BY playerID;

SELECT * 
FROM salaries
WHERE playerID IN ('correca01','colege01','harpebr03','strasst01','beckhti01','priceda01','hochelu01','uptonju01','bushma01','youngde03','bullibr01','mauerjo01','gonzaad01','hamiljo03','burrepa01','anderma01','erstada01','wilsopa02','rodrial01','nevinph01','jonesch06','mcdonbe01','benesan01','griffke02','kingje01','surhobj01','abnersh01','belchti01','dunstsh01','mooremi01','strawda01','chambal01')
ORDER BY playerID;
