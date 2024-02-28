CREATE DATABASE trigger_demo;
CREATE TABLE users (
    username VARCHAR(100),
    age INT
);
INSERT INTO users(username, age) VALUES ("bobby", 23);
DELIMITER $$

CREATE TRIGGER must_be_adult 
	BEFORE INSERT on users FOR EACH ROW 
	BEGIN
		IF NEW.age < 18 
        THEN 
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Must be an adult!';
		END IF;
	END;
$$ 

DELIMITER ;
INSERT INTO users(username, age) VALUES ("sally", 16);
INSERT INTO users(username, age) VALUES ("sue", 54);

-- Trigger on instagram database
DELIMITER $$

CREATE TRIGGER prevent_self_follows
	BEFORE INSERT ON follows FOR EACH ROW 
		BEGIN
			IF NEW.follower_id = NEW.followee_id
            THEN 
				SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'You caonnot follow yourself!';
            END IF;
        END;
$$

DELIMITER ;
INSERT INTO follows(follower_id, followee_id) VALUES (5, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 2);

-- Creating unfollows table in ig_clone database
CREATE TABLE unfollows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW (),
    FOREIGN KEY (follower_id)
        REFERENCES users (id),
    FOREIGN KEY (followee_id)
        REFERENCES users (id),
    PRIMARY KEY (follower_id , followee_id)
);

-- Creating trigger for ig_clone database
DELIMITER $$

CREATE TRIGGER capture_unfollow 
	AFTER DELETE ON follows FOR EACH ROW 
	BEGIN
		INSERT INTO unfollows
        SET
        follower_id = OLD.follower_id,
        followee_id = OLD.followee_id;
	END;
    
$$

DELIMITER ;

SELECT 
    *
FROM
    follows
LIMIT 5;

DELETE FROM follows 
WHERE
    follower_id = 2 AND followee_id = 1;

SELECT 
    *
FROM
    unfollows;
DROP TRIGGER prevent_self_follows;
SHOW TRIGGERS; 