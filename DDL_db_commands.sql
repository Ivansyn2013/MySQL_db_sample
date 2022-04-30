DROP DATABASE IF EXISTS medical_db;
CREATE DATABASE medical_db;
USE medical_db ;




DROP TABLE IF EXISTS doctors;
CREATE TABLE doctors (
	id SERIAL PRIMARY KEY, 
	created_at DATETIME DEFAULT NOW(),
	first_name varchar (50),
	second_name varchar (50), 
	date_of_bithd DATETIME NOT NULL,
	phone bigint UNSIGNED NOT NULL UNIQUE,
	email  VARCHAR(120) UNIQUE NOT NULL,
	gender char(1),
	qualification varchar (250),
	salary decimal,
	
	INDEX doctors_idx(first_name, second_name, phone, email)
	) ;

DROP TABLE IF EXISTS patients;
CREATE TABLE patients (
	id SERIAL PRIMARY KEY, 
	first_name varchar (50),
	second_name varchar (50), 
	created_at DATETIME DEFAULT NOW(),
	date_of_bithd DATETIME NOT NULL,
	phone bigint UNSIGNED NOT NULL UNIQUE,
	email  VARCHAR(120) UNIQUE NOT NULL,
	history_number BIGINT UNSIGNED NOT NULL UNIQUE,
	gender char(1),
	doctor_id bigint UNSIGNED,
	
	
	FOREIGN KEY (doctor_id) REFERENCES doctors(id),
	INDEX patients_idx(first_name, second_name, phone, email)
	) ;

DROP TABLE IF EXISTS price;
CREATE TABLE price (
	id SERIAL PRIMARY KEY,
	procedure_numb BIGINT UNSIGNED NOT NULL UNIQUE ,
	procedure_name varchar (250),
	price DECIMAL ,
	
		
	
	INDEX price_idx(procedure_name,procedure_numb)
	) ;

DROP TABLE IF EXISTS laboratory_data;
CREATE TABLE laboratory_data(
	id SERIAL PRIMARY KEY, 
	user_id bigint UNSIGNED, # Ð²ÐµÐ·Ð´Ðµ Ð½Ð°Ð¿Ð¸ÑÐ°Ð» USER Ð²Ð¼ÐµÑÑ‚Ð¾ patient, Ð½Ð¾ Ð½Ðµ Ð·Ð½Ð°ÑŽ ÐºÐ°Ðº Ñ‚ÐµÐ¿ÐµÑ€ÑŒ Ð¿Ð¾Ð¼ÐµÐ½ÑÑ‚ÑŒ Ð²Ð¾ Ð²ÑÐµÐ¼ ÐºÐ¾Ð´Ðµ
	blood_an MEDIUMBLOB ,
	urina_an MEDIUMBLOB,
	created_at DATETIME DEFAULT NOW(),
	biophsy MEDIUMBLOB,
	history_number BIGINT UNSIGNED NOT NULL UNIQUE,
	procedure_numb BIGINT UNSIGNED NOT NULL,
	
	
	FOREIGN KEY (user_id) REFERENCES patients(id),
	FOREIGN KEY (procedure_numb) REFERENCES price(procedure_numb),
	INDEX laboratory_idx(user_id)
	) ;



DROP TABLE IF EXISTS dicom_data;
CREATE TABLE dicom_data (
	id SERIAL PRIMARY KEY, 
	user_id bigint UNSIGNED,
	ct_data LONGBLOB,
	mri_data LONGBLOB,
	us_data LONGBLOB,
	created_at DATETIME DEFAULT NOW(),
	history_number BIGINT UNSIGNED NOT NULL UNIQUE,
	procedure_numb BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (user_id) REFERENCES patients(id),
	FOREIGN	KEY (history_number) REFERENCES patients(history_number), 
	FOREIGN KEY (procedure_numb) REFERENCES price(procedure_numb),
	INDEX dicom_idcx(user_id,history_number)
	) ;
	
DROP TABLE IF EXISTS bill;
CREATE TABLE bill (
	id SERIAL PRIMARY KEY, 
	created_at DATETIME DEFAULT NOW(),
	user_id bigint UNSIGNED,
	history_number BIGINT UNSIGNED NOT NULL ,
	bill_status BIT(1),
	cost DECIMAL,
	
	
	FOREIGN KEY (user_id) REFERENCES patients(id),
	INDEX bill_idx(user_id)
	) ;




DROP TABLE IF EXISTS nurses;
CREATE TABLE nurses (
	id SERIAL PRIMARY KEY, 
	created_at DATETIME DEFAULT NOW(),
	first_name varchar (50),
	second_name varchar (50), 
	date_of_bithd DATETIME NOT NULL,
	phone bigint UNSIGNED NOT NULL UNIQUE,
	email  VARCHAR(120) UNIQUE NOT NULL,
	gender char(1),
	qualification varchar (250),
	salary decimal,
	
	INDEX nurses_idx(first_name, second_name, phone, email)
	) ;

DROP TABLE IF EXISTS nurses;
CREATE TABLE nurses (
	id SERIAL PRIMARY KEY, 
	created_at DATETIME DEFAULT NOW(),
	first_name varchar (50),
	second_name varchar (50), 
	date_of_bithd DATETIME NOT NULL,
	phone bigint UNSIGNED NOT NULL UNIQUE,
	email  VARCHAR(120) UNIQUE NOT NULL,
	gender char(1),
	qualification varchar (250),
	salary decimal,
	
	INDEX other_w_idx(first_name, second_name, phone, email)
	) ;



DROP TABLE IF EXISTS departmens;
CREATE TABLE departmens (
	id SERIAL PRIMARY KEY, 
	created_at DATETIME DEFAULT NOW(),
	name varchar (50),
	doctor_id bigint UNSIGNED,
	nurses_id bigint UNSIGNED,
	phone bigint UNSIGNED NOT NULL UNIQUE,
	speciality varchar (250),
	user_id bigint UNSIGNED,
	
	FOREIGN KEY (nurses_id) REFERENCES nurses(id),
	FOREIGN KEY (doctor_id) REFERENCES doctors(id),
	FOREIGN KEY (user_id) REFERENCES patients(id)
	) ;


DROP TABLE IF EXISTS history;
CREATE TABLE history (
	id SERIAL PRIMARY KEY, 
	created_at DATETIME DEFAULT NOW(),
	name varchar (50),
	doctor_id bigint UNSIGNED,
	nurses_id bigint UNSIGNED,
	departmens_id bigint UNSIGNED,
	status varchar (250),
	note_type bigint UNSIGNED,
	context TEXT,
	user_id bigint UNSIGNED,
	
	FOREIGN KEY (nurses_id) REFERENCES nurses(id),
	FOREIGN KEY (doctor_id) REFERENCES doctors(id),
	FOREIGN KEY (user_id) REFERENCES patients(id),
	FOREIGN KEY (departmens_id) REFERENCES departmens(id)
	) ;



DROP TABLE IF EXISTS procedures_list;
CREATE TABLE procedures_list  (
	id SERIAL PRIMARY KEY, 
	created_at DATETIME DEFAULT NOW(),
	name varchar (50),
	doctor_id bigint UNSIGNED,
	nurses_id bigint UNSIGNED,
	departmens_id bigint UNSIGNED,
	status varchar (250),
	note_type bigint UNSIGNED,
	context TEXT,
	user_id bigint UNSIGNED,
	procedure_numb BIGINT UNSIGNED,
	
	
	FOREIGN KEY (nurses_id) REFERENCES nurses(id),
	FOREIGN KEY (doctor_id) REFERENCES doctors(id),
	FOREIGN KEY (user_id) REFERENCES patients(id),
	FOREIGN KEY (departmens_id) REFERENCES departmens(id),
	FOREIGN KEY (procedure_numb) REFERENCES price(procedure_numb)
	) ;

#êîíåö ñîçäàíèÿ òàáëèö





# Ïðåäñòàâëåíèÿ, ïðîöåäóðû, ôóíêöèè

#ìåñÿ÷íûé çàðàáîòîê
DROP VIEW IF EXISTS mounth_debit ;
CREATE VIEW mounth_debit AS 
	SELECT sum(cost) FROM bill
	WHERE bill_status = 1 AND datediff (  Now(), created_at  ) < 30; 
	


#ìåñÿ÷íûå ïðîöåäóðû
DROP VIEW IF EXISTS procedures_mounth_list ;
CREATE VIEW procedures_mounth_list AS 
	SELECT patients.second_name, doctors.second_name AS doctors, procedures_list.name 
	FROM patients
	JOIN history  ON history.user_id = patients.id
	JOIN procedures_list ON procedures_list.user_id = patients.id
	JOIN doctors  ON doctors.id = procedures_list.doctor_id  
	WHERE datediff( Now(), history.created_at ) < 30;


# êîëè÷åñòâî âûïîëíåíûõ ìàíèïóëÿöèé 

DROP VIEW IF EXISTS procedures_count ;
CREATE VIEW procedures_count AS 
	SELECT  procedures_list.name AS pr_name,
			departmens.name AS department,
			count(*)
			FROM procedures_list
	JOIN departmens  ON departmens.id = procedures_list.departmens_id 
	GROUP BY pr_name ;


#ñïèñîê âûïîëíåíûõ ïàöèåyòó ìàíèïóëÿöèé



DROP PROCEDURE IF EXISTS user_proc_list;
delimiter // 
CREATE PROCEDURE user_proc_list(user_id_pro bigint unsigned )
BEGIN
	

SELECT procedures_list.name AS Name 
	FROM procedures_list
	WHERE user_id = user_id_pro AND procedures_list.status = 1
	
UNION ALL
SELECT doctors.second_name AS doctor 
	FROM doctors 
	JOIN history ON doctor_id = doctors.id 
	JOIN patients ON patients.id = history.user_id 
	WHERE user_id = user_id_pro 
UNION ALL 
SELECT bill.cost  FROM bill
WHERE bill.user_id = user_id_pro ;

END //	
delimiter ;


CALL user_proc_list (1);



#èçìåíåíèå ñòàòóñà èññëåäîâàíèÿ
DROP TRIGGER IF EXISTS change_proc_status ;
delimiter //
CREATE TRIGGER change_proc_status AFTER INSERT ON dicom_data
FOR EACH ROW 
BEGIN
	UPDATE  procedures_list 
	SET status = 1 
	WHERE dicom_data.user_id = procedures_list.user_id 
		AND dicom_data.procedure_numb = procedures_list.procedure_numb ;
	
END //
delimiter ;































