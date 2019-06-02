SELECT l.session_id, l.sortie_id,
	(
		SELECT COUNT(DISTINCT ucid)
        FROM raw_gameevents_log ll
        WHERE ll.session_id = l.session_id AND ll.sortie_id = l.sortie_id AND ucid IS NOT NULL
	) AS ucidcount
FROM raw_gameevents_log l
WHERE l.ucid IS NULL;

