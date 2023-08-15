BEGIN;

CREATE TABLE alembic_version (
    version_num VARCHAR(32) NOT NULL, 
    CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num)
);

-- Running upgrade  -> cabcbd0d8153

CREATE TABLE users (
    id BIGSERIAL NOT NULL, 
    uuid UUID NOT NULL, 
    email VARCHAR(255) NOT NULL, 
    password VARCHAR(255) NOT NULL, 
    username VARCHAR(255) NOT NULL, 
    is_admin BOOLEAN, 
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
    updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
    PRIMARY KEY (id), 
    UNIQUE (email), 
    UNIQUE (username), 
    UNIQUE (uuid)
);

CREATE TABLE tasks (
    id BIGSERIAL NOT NULL, 
    uuid UUID NOT NULL, 
    title VARCHAR(255) NOT NULL, 
    description VARCHAR(255) NOT NULL, 
    is_completed BOOLEAN NOT NULL, 
    task_author_id BIGINT NOT NULL, 
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
    updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
    PRIMARY KEY (id), 
    FOREIGN KEY(task_author_id) REFERENCES users (id), 
    UNIQUE (uuid)
);

INSERT INTO alembic_version (version_num) VALUES ('cabcbd0d8153') RETURNING alembic_version.version_num;

COMMIT;

