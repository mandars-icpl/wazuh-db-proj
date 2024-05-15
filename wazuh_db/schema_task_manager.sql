/*
 * SQL Schema for task manager database
 * Copyright (C) 2015, Wazuh Inc.
 * July 13, 2020.
 * This program is a free software, you can redistribute it
 * and/or modify it under the terms of GPLv2.
 */

BEGIN;

CREATE TABLE IF NOT EXISTS TASKS (
    TASK_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    AGENT_ID INT NOT NULL,
    NODE TEXT NOT NULL,
    MODULE TEXT NOT NULL,
    COMMAND TEXT NOT NULL,
    CREATE_TIME INTEGER NOT NULL,
    LAST_UPDATE_TIME INTEGER,
    STATUS TEXT NOT NULL,
    ERROR_MESSAGE TEXT DEFAULT NULL
);
CREATE INDEX IF NOT EXISTS IN_TASK_ID ON TASKS (TASK_ID);
CREATE INDEX IF NOT EXISTS IN_TASK_AGENT ON TASKS (AGENT_ID);
CREATE INDEX IF NOT EXISTS IN_TASK_NODE ON TASKS (NODE);
CREATE INDEX IF NOT EXISTS IN_TASK_MODULE ON TASKS (MODULE);
CREATE INDEX IF NOT EXISTS IN_TASK_COMMAND ON TASKS (COMMAND);
CREATE INDEX IF NOT EXISTS IN_TASK_CREATE_TIME ON TASKS (CREATE_TIME);
CREATE INDEX IF NOT EXISTS IN_TASK_LAST_UPDATE_TIME ON TASKS (LAST_UPDATE_TIME);
CREATE INDEX IF NOT EXISTS IN_TASK_STATUS ON TASKS (STATUS);
CREATE INDEX IF NOT EXISTS IN_TASK_ERROR_MESSAGE ON TASKS (ERROR_MESSAGE);

CREATE TABLE IF NOT EXISTS METADATA (
    key TEXT PRIMARY KEY,
    value TEXT
);

INSERT INTO METADATA (key, value) VALUES ('db_version', '1');

END;
