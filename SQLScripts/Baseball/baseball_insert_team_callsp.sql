USE baseball;

SET @teamid = 0;
CALL baseball.usp_insert_team('Charleston Riverdogs', 'CHS', 'NL', 'NL EAST',@teamid);

SELECT @teamid;

