INSERT INTO roles(name) VALUES('ROLE_USER');
INSERT INTO roles(name) VALUES('ROLE_ADMIN');

INSERT INTO users(created_at, updated_at, email, name, password, username) VALUES (CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'test@abc.com','test','$2a$10$6Qp0TCaMWMM9.BqFmLvkbe3EgYnSgB3tqerzJn5gGksjbCYyb4YZe','test');
INSERT INTO polls(created_at, updated_at, created_by, updated_by, expiration_date_time, question) VALUES ( CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,1,1,DATEADD('DAY',7, CURRENT_DATE),'What''s your favorite programming language?');
INSERT INTO user_roles VALUES (1,1);
INSERT INTO choices(poll_id, text) VALUES (1,'C++');
INSERT INTO choices(poll_id, text) VALUES (1,'C#');
INSERT INTO choices(poll_id, text) VALUES (1,'Java');
INSERT INTO choices(poll_id, text) VALUES (1,'Javascript');
INSERT INTO choices(poll_id, text) VALUES (1,'Python');