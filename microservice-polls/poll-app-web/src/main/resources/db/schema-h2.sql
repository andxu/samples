CREATE TABLE users (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  name varchar(40) NOT NULL,
  username varchar(15) NOT NULL,
  email varchar(40) NOT NULL,
  password varchar(100) NOT NULL,
  created_at datetime DEFAULT NULL,
  updated_at datetime DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_users_username (username),
  UNIQUE KEY uk_users_email (email)
)  DEFAULT CHARSET=utf8;

CREATE TABLE roles (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  name varchar(60) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_roles_name (name)
)  AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


CREATE TABLE user_roles (
  user_id bigint(20) NOT NULL,
  role_id bigint(20) NOT NULL,
  PRIMARY KEY (user_id,role_id),  
  FOREIGN KEY (role_id) REFERENCES roles (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
)  DEFAULT CHARSET=utf8;


CREATE TABLE polls (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  question varchar(140) NOT NULL,
  expiration_date_time datetime NOT NULL,
  created_at datetime DEFAULT NULL,
  updated_at datetime DEFAULT NULL,
  created_by bigint(20) DEFAULT NULL,
  updated_by bigint(20) DEFAULT NULL,
  PRIMARY KEY (id)
)  DEFAULT CHARSET=utf8;


CREATE TABLE choices (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  text varchar(40) NOT NULL,
  poll_id bigint(20) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (poll_id) REFERENCES polls (id)
)  DEFAULT CHARSET=utf8;


CREATE TABLE votes (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  user_id bigint(20) NOT NULL,
  poll_id bigint(20) NOT NULL,
  choice_id bigint(20) NOT NULL,
  created_at datetime DEFAULT NULL,
  updated_at datetime DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (poll_id) REFERENCES polls (id),
  FOREIGN KEY (choice_id) REFERENCES choices (id)
) DEFAULT CHARSET=utf8;