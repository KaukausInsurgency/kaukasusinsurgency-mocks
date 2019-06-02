DROP VIEW IF EXISTS view_first_ucid_row;

-- Create view to store the first occurance of gameevent record for unique ucids
CREATE VIEW view_first_ucid_row AS
SELECT * FROM raw_gameevents_log
GROUP BY ucid;

-- increment the sortie_id on all these records so that each sortie_id is unique

SELECT COUNT(*) FROM view_first_ucid_row;

    SET @a  = 0 ;  
    UPDATE raw_gameevents_log SET sortie_id = @a:=@a+1 
    WHERE id <= 10 AND event = "TAKEOFF";

SELECT id, server_id, session_id, sortie_id, ucid, event
FROM raw_gameevents_log
WHERE event = "TAKEOFF"
GROUP BY ucid, event;

SELECT id, server_id, session_id, sortie_id, ucid, event
FROM raw_gameevents_log
GROUP BY session_id, ucid
