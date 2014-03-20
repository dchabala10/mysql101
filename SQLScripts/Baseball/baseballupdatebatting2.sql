USE baseball;

SET SQL_SAFE_UPDATES = 0;

update baseball.batting2
INNER JOIN baseball.Roster ON baseball.batting2.PlayerID = baseball.Roster.PlayerID
SET baseball.batting2.TeamID = baseball.roster.TeamID
;

SET SQL_SAFE_UPDATES = 1;