CREATE TABLE IF NOT EXISTS unites
(
    id     INTEGER PRIMARY KEY,
    name   TEXT NOT NULL,
    code   TEXT NOT NULL,
    branch TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS classrooms
(
    id       INTEGER PRIMARY KEY,
    name     TEXT NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS instructors
(
    id         INTEGER PRIMARY KEY,
    name       TEXT NOT NULL,
    department TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS events
(
    id          INTEGER PRIMARY KEY,
    activity_id INTEGER                  NOT NULL,
    name        TEXT                     NOT NULL,
    description TEXT,
    category    TEXT,
    INFO        TEXT,
    start_at    TIMESTAMP WITH TIME ZONE NOT NULL,
    end_at      TIMESTAMP WITH TIME ZONE NOT NULL,
    unite_id    INTEGER REFERENCES unites (id)
);

-- DO NOT EXECUTE
-- CREATE TEMPORARY TABLE IF NOT EXISTS activities_temp
-- (
--     id INTEGER PRIMARY KEY,
--     description TEXT,
--     category TEXT,
--     info TEXT
-- );


CREATE TABLE IF NOT EXISTS events_classrooms
(
    event_id     INTEGER REFERENCES events (id),
    classroom_id INTEGER REFERENCES classrooms (id),
    PRIMARY KEY (event_id, classroom_id)
);

CREATE TABLE IF NOT EXISTS events_instructors
(
    event_id      INTEGER REFERENCES events (id),
    instructor_id INTEGER REFERENCES instructors (id),
    PRIMARY KEY (event_id, instructor_id)
);

