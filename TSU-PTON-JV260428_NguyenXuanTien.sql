Create database football_teams;
use football_teams;
-- TẠO các bảng 
CREATE TABLE football_teams(
	team_id INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(100) NOT NULL,
    team_code VARCHAR(20) NOT NULL UNIQUE,
    home_area VARCHAR(100) NOT NULL,
    founded_date DATE NOT NULL
);

CREATE TABLE players(
	player_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    preferred_position VARCHAR(30) NOT NULL,
    team_code VARCHAR(15) NOT NULL UNIQUE,
    skill_rating DECIMAL(1,3) DEFAULT 5.0,
    CONSTRAINT ck_player_skill
		CHECK(skill_rating >= 0  AND skill_rating <= 10.0)
);

CREATE TABLE matches (
	match_id INT AUTO_INCREMENT PRIMARY KEY,
    team_id INT,
    opponent_name VARCHAR(100) NOT NULL,
    venue VARCHAR(150)NOT NULL,
    match_time DATETIME NOT NULL,
    pitch_fee DECIMAL(10,2),
    status VARCHAR(30),
    CONSTRAINT fk_matches_team
		FOREIGN KEY (team_id)
        REFERENCES football_teams(team_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
	CONSTRAINT ck_pitch_fee
		CHECK(pitch_fee>=0),
	CONSTRAINT ck_match_status
		CHECK ( status IN ('Scheduled','Completed','Cancelled'))
    );

CREATE TABLE match_registrations(
	registration_id INT AUTO_INCREMENT PRIMARY KEY,
    match_id INT,
    player_id INT,
    attendacne_status  VARCHAR(30),
    goals INT DEFAULT 0,
    registered_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_registration_match
     FOREIGN KEY (match_id)
	REFERENCES matches(match_id)
     ON UPDATE CASCADE
	ON DELETE RESTRICT,
     CONSTRAINT fk_registration_player
     FOREIGN KEY (player_id)
	REFERENCES players(player_id)
     ON UPDATE CASCADE
	ON DELETE RESTRICT,
    CONSTRAINT ck_goals
		CHECK (goals >= 0),
	CONSTRAINT uq_match_player
		UNIQUE (match_id,player_id)
);

CREATE TABLE team_logs(
	log_id INT AUTO_INCREMENT PRIMARY KEY,
    registration_id INT,
    player_id INT,
    log_time DATETIME NOT NULL,
    note TEXT NOT NULL,
    CONSTRAINT fk_logs_registration 
     FOREIGN KEY (registration_id)
	REFERENCES match_registration(registration_id)
     ON UPDATE CASCADE
	ON DELETE RESTRICT,
    CONSTRAINT fk_logs_player
		FOREIGN KEY (player_id)
	REFERENCES players(player_id)
      ON UPDATE CASCADE
	ON DELETE RESTRICT
    );
 -- INSERT dữ liệu    
 -- bảng football_teams
INSERT INTO football_teams(team_id,team_name ,team_code,home_area ,founded_date)
VALUES
(1,'Sài Gòn Strikers','SGS','Quận 1','3/10/2018'),
(2,'Thunder FC','TFC','TP Thủ Đức','6/15/2021'),
(3,'Brothers United','BRU','Bình Thạnh','9/20/2016'),
(4,'Weekend Warriors','WKW','Quận 7','1/8/2022'),
(5,'Office Eleven','O11','Gò Vấp','11/30/2019');
-- bảng players
INSERT INTO players(player_id ,full_name ,preferred_position ,team_code ,skill_rating)
VALUES
(1,'Nguyễn Minh Khang','Tiền đạo','901112233',8.2),
(2,'Trần Hoàng Nam','Tiền vệ','902223344',7.5),
(3,'Lê Quốc Huy','Hậu vệ','903334455',7.8),
(4,'Phạm Gia Bảo','Thủ môn','904445566',8.2),
(5,'Võ Thành Công','Tiền vệ','905556677',7);
-- bảng matches
INSERT INTO matches(match_id,team_id,opponent_name,venue,match_time,pitch_fee,status)
VALUES
(7001,1,'Blacks Cats','Sân Tao Đàn','5/20/2026 18:00',1200000,'Scheduled'),
(7002,3,'Blue Sharks','Sân Gia Định','5/21/2026 19:30',1500000,'Completed'),
(7002,2,'Bình Minh FC','Sân Linh Trung','5/22/2026 18:30',1000000,'Completed'),
(7004,5,'Red Bulls','Sân Kỳ Hòa','5/23/2026 20:00',1300000,'Cancelled'),
(7005,4,'Young Boys','Sân Hoàng Văn Thụ','5/24/2026 17:30',1100000,'Scheduled');
-- bảng match_registrations
INSERT INTO match_registrations(registration_id,match_id,player_id,attendacne_status,goals,registered_at)
VALUES
(8001,7002,1,'Played',2,'5/19/2026 9:00'),
(8002,7002,3,'Played',0,'5/19/2026 9:15'),
(8003,7001,2,'Registered',0,'5/18/2026 20:00'),
(8004,7003,5,'Played',1,'5/20/2026 8:30'),
(8005,7004,4,'Absent',0,'5/21/2026 10:00');
-- bảng team_logs
INSERT INTO team_logs(log_id,registration_id,player_id,log_time,note)
VALUES
(1,8003,2,'5/18/2026 20:05','Xác nhận tham gia trận'),
(2,8001,1,'5/19/2026 9:05','Đăng ký đá chính'),
(3,8002,3,'5/19/2026 9:20','Xác nhận tham gia'),
(4,8004,5,'5/20/2026 8:35','Đã có mặt tại sân'),
(5,8005,4,'5/23/2026 20:05','Vắng mặt không báo trước');

-- CÂU 2 : UPDATE&DELETE

-- TĂNG pitch_fee

UPDATE matches
set pitch_fee = pitch_fee + 100000
where status = 'Completed';

-- xóa bản ghi trong team_logs

DELETE FROM team_logs
where log_time < '20/05/2026';

-- PHẦN 3 : Truy vấn cơ bản 

-- câu 1 
SELECT full_name, preferred_position, skill_rating from players
where skill_rating > 7.8
	or preferred_position = 'Tiền vệ';
    
-- câu 2 
 SELECT opponent_name, venue, match_time from matches
 where match_time >= '2026-05-20'
 and match_time < '2026-05-22'
 and opponent_name like 'B%';
 
 -- câu 3 
 SElECT registration_id, goals, registered_at from match_registrations
 order by goals DESC, registration_id ASC
 LIMIT 2 OFFSET 2;
 
 
 -- PHẦN 4 : TRUY VẤN NÂNG CAO
 -- câu 1 
 SELECT
  ft.team_name,m.oppenent_name,f.full_name,f.preferred_position,g.goals,m.match_time
from match_registrations g
JOIN matches m
	on m.match_id = g.match_id
JOIN football_team ft 
	on m.team_id = ft.team_id
JOIN players f
	on f.player_id =g.player_id;

-- câu 2 
 SELECT p.fullname, SUM(g.goals)  total_goals
 from players f
 JOIN  match_registrations g
	on f.player_id = g.player_id
where g.attendace_status = 'Played'
GROUP BY f.player_id, f.full_name
HAVING SUM(g.goals) > 1 ;

-- câu 3 
SELECT player_id, full_name, skill_rating from players
where skill_rating =(
	SELECT MAX(skill_rating)
    from players
);


--  PHẦN 5 INDEX & VIEW 

-- câu 1
CREATE INDEX idx_attendance_status_goals
on match_registrations(attendance_status, goals);

-- câu 2 

CREATE VIEW v_player AS
SELECT f.player_id,f.full_name,COUNT(g.registation_id) total_registration,COALESCE(SUM(g.goals),0) total_goal
from players f 
LEFT JOIN match_registrations g
 on f.player_id = g.player_id
 and g.attendance_status <> 'Absent'
GROUP BY  f.player_id,f.full_name;
 
 -- PHẦN 6 : TRIGGER
 DELIMITER $$
 CREATE TRIGGER trg_registrations_player 
 AFTER UPDATE ON match_registrations
 for each ROW
 BEGIN
  IF OLD.attendance_status <> 'Played' 
	and NEW.attendance_status = 'Played' THEN
    INSERT INTO team_logs(registration_id,player_id,log_time,note)
    VALUES (NEW.registration_id,NEW.player_id,CURRENT_TIMESTAMP,'Player confirmed as played');
  END IF ;
END$$
DELIMITER ;


-- CÂU 2 
 DELIMITER $$
 CREATE TRIGGER trg_registrations_player_skill
 AFTER INSERT ON match_registrations
 for each ROW
 BEGIN
  IF NEW.attendance_status <> 'Played'  THEN
    UPDATE players
    set skill_rating = LEAST(skill_rating + 0.1,10.0)
    where player_id = NEW.player_id;
  END IF ;
END$$
DELIMITER ;

-- PHẦN 7 stored produce 
-- câu 1 

DELIMITER $$
CREATE PROCEDURE pr_player_goal_status(in f_player_id INT)
BEGIN 
	DECLARE v_total_goals INT DEFAULT 0;
    SELECT COALESCE(SUM(goals),0)
    INTO V_total_goals
    FROM match_registrations
    WHERE player_id =  f_player_id
		and attendance_status = 'Played';
	SELECT f_player_id  player_id, V_total_goals total_goals,
    CASE 
		WHEN v_total_goals > 3 THEN 'Top scorer'
        WHEN v_total_goals = 3  THEN 'Target met'
        ELSE 'Keep training'
        END AS message;
END$$
DELIMITER ; 