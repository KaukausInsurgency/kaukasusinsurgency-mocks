RENAME TABLE raw_gameevents_log TO t1;

CREATE TABLE raw_gameevents_log LIKE t1;

DROP TABLE t1;