CREATE TABLE users(
  email VARCHAR(255), 
  created_at TIMESTAMP DEFAULT NOW() 
);
INSERT INTO users(email) VALUES
('Katie34@yahoo.com'),
('Tunde@gmail.com');