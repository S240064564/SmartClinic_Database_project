-- Creat the database 
DROP DATABASE IF EXISTS SmartClinicDB;
CREATE DATABASE SmartClinicDB;
USE SmartClinicDB;

-- 1. Staff Table
CREATE TABLE Staff (
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    role VARCHAR(30) NOT NULL,
    date_of_birth DATE,
    phone VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    national_address VARCHAR(255)
);

-- 2. Doctors Table
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    specialization VARCHAR(100) NOT NULL,
    license_number VARCHAR(50) UNIQUE NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES Staff(staff_id) ON DELETE CASCADE

-- 3. Receptionists Table
CREATE TABLE Receptionists (
    receptionist_id INT PRIMARY KEY,
    desk_number VARCHAR(10) NOT NULL,
    shift_type VARCHAR(20) NOT NULL,
    FOREIGN KEY (receptionist_id) REFERENCES Staff(staff_id) ON DELETE CASCADE
);

-- 4. Patients Table
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL, 
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10),
    phone VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    national_address VARCHAR(255)
);

-- 5. Appointments Table
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    duration INT DEFAULT 30, -- In minutes
    status VARCHAR(20) NOT NULL DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- 6. Payments Table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT UNIQUE NOT NULL,
    patient_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method VARCHAR(20) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

-- 7. Treatments Table
CREATE TABLE Treatments (
    treatment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL UNIQUE,
    treatment_name VARCHAR(100) NOT NULL,
    treatment_cost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id) ON DELETE CASCADE
);

-- 8. Medicine Table
CREATE TABLE Medicine (
    medicine_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_name VARCHAR(100) NOT NULL,
    description TEXT,
    unit_price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0
);

-- 9. Treatment_Medicine Table
CREATE TABLE Treatment_Medicine (
    treatment_id INT NOT NULL,
    medicine_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    dosage VARCHAR(100),
    instructions VARCHAR(255),
    PRIMARY KEY (treatment_id, medicine_id),
    FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id) ON DELETE CASCADE,
    FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id) ON DELETE CASCADE
);

-- Insert Data into Staff
 INSERT INTO Staff (first_name, last_name, role, phone, email) VALUES
 ('Ahmed', 'Almansour', 'Doctor', '0501234567', 'ahmed@clinic.com'),
('Sarah', 'Alotaibi', 'Doctor', '0507654321', 'sarah@clinic.com'),
('Noura', 'Alsudairy', 'Receptionist', '0500001122', 'noura@clinic.com'),
('Khalid', 'Alenazi', 'Doctor', '0509998877', 'khalid.e@clinic.com'),
('Layan', 'Alharbi', 'Receptionist', '0508887766', 'layan@clinic.com'),
('Faisal', 'Alotaibi', 'Doctor', '0505556677', 'faisal@clinic.com'),
('Amal', 'Alshahrani', 'Doctor', '0504443322', 'amal@clinic.com'),
('Mona', 'Algahtani', 'Receptionist', '0503332211', 'mona@clinic.com'),
('Huda', 'Alharbi', 'Receptionist', '0502221100', 'huda@clinic.com'),
('Reem', 'Algamdi', 'Receptionist', '0501110099', 'reem@clinic.com');

-- Insert Data into Doctors
INSERT INTO Doctors (doctor_id, specialization, license_number) VALUES
(1, 'Cardiology', 'LIC12345'),
(2, 'Pediatrics', 'LIC67890'),
(4, 'Dermatology', 'LIC55443'),
(6, 'Neurology', 'LIC99887'),
(7, 'Gynecology', 'LIC77665');

-- Insert Data into Receptionists
INSERT INTO Receptionists (receptionist_id, desk_number, shift_type) VALUES
(3, 'Desk-A', 'Morning'),
(5, 'Desk-B', 'Evening'),
(8, 'Desk-A', 'Night'),
(9, 'Desk-C', 'Morning'),
(10, 'Desk-B', 'Evening');

-- Insert Date into Patients
INSERT INTO Patients (first_name, last_name, date_of_birth, gender, phone, email) VALUES
('Khalid', 'Alharbi', '1990-05-12', 'Male','0555554433', 'khalid@mail.com'),
('Maha', 'Alghamdi', '1995-10-22', 'Female', '0544443322', 'maha@mail.com'),
('Fahad', 'Aldossari', '1988-01-15', 'Male', '0533332211', 'fahad@mail.com'),
('Rayan', 'Almutairi', '2000-08-30', 'Female', '0566667788', 'rayan@mail.com'),
('Aisha', 'Algahtani', '1993-04-05', 'Female', '0577778899', 'aisha@mail.com');

-- Insert Data into Appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, status) VALUES
(1, 1, '2026-07-15', '10:00:00', 'Scheduled'),
(2, 2, '2026-07-16', '14:30:00', 'Scheduled'),
(3, 1, '2026-07-12', '09:00:00', 'Completed'),
(4, 4, '2026-07-18', '11:15:00', 'Scheduled'),
(5, 2, '2026-07-19', '16:00:00', 'No Show');

-- Insert Data into Payments
INSERT INTO Payments (patient_id, appointment_id, amount, payment_date, payment_method) VALUES
(1, 1, 150.00, '2026-07-15', 'Cash'),
(2, 2, 200.00, '2026-07-16', 'Apple Pay'),
(3, 3, 250.00, '2026-07-12', 'Credit Card'),
(4, 4, 350.00, '2026-07-18', 'Credit Card'),
(5, 5, 150.00, '2026-07-19', 'Mada');

-- Insert Data into Treatments
INSERT INTO Treatments (appointment_id, treatment_name, treatment_cost) VALUES
(1, 'ECG and Consultation', 150.00),
(2, 'Routine Pediatric Checkup', 100.00),
(3, 'Cardiology Follow-up', 200.00),
(4, 'Skin Rash Treatment', 120.00),
(5, 'Joint Pain Examination', 180.00);

-- Insert Data into Medicine 
INSERT INTO Medicine (medicine_name, description, unit_price, stock_quantity) VALUES
('Aspirin 81mg', 'Blood thinner and pain reliever', 15.00, 100),
('Multi-Vitamins', 'Dietary supplement for children', 25.00, 150),
('Beta Blockers', 'Medicine for heart conditions', 45.00, 80),
('Hydrocortisone Cream', 'Topical steroid for skin irritation', 30.00, 60),
('Ibuprofen 400mg', 'Nonsteroidal anti-inflammatory drug', 12.50, 200);

-- Insert Data into Treatment_Medicine
INSERT INTO Treatment_Medicine (treatment_id, medicine_id, quantity, dosage, instructions) VALUES
(1, 1, 1, '81mg', 'Take 1 tablet daily with food'),
(2, 2, 2, '1 tablet', 'Take 1 chewable tablet daily'),
(3, 3, 1, '50mg', 'Take 1 tablet every morning'),
(4, 4, 1, 'Apply twice daily', 'Apply thin layer to affected skin'),
(5, 5, 3, '400mg', 'Take 1 tablet every 8 hours as needed');

-- Show Data
SELECT * FROM Staff;
SELECT * FROM Doctors;
SELECT * FROM Receptionists;
SELECT * FROM Patients;
SELECT * FROM Appointments;
SELECT * FROM Payments;
SELECT * FROM Treatments;
SELECT * FROM Medicine;
SELECT * FROM Treatment_Medicine;

-- ==============
-- TASK 3. SQL OPERATIONS
-- ==============

-- Query 1: Select
SELECT first_name, last_name, email
From Patients;

-- Query 2: Join
SELECT 
  p.first_name,
  p.last_name, 
  d.specialization,
  a.appointment_date
FROM Patients p 
INNER JOIN Appointments a 
ON p.patient_id = a.patient_id
INNER JOIN Doctors d 
ON a.doctor_id = d.doctor_id;

-- Query 3: Nested query
SELECT first_name, last_name
FROM Patients
WHERE patient_id IN (
	SELECT a.patient_id
    FROM Appointments a 
    JOIN Treatments t
		ON a.appointment_id = t.appointment_id
	JOIN Treatment_Medicine tm 
		ON t.treatment_id = tm.treatment_id
	JOIN Medicine m
		ON tm.medicine_id = m.medicine_id
    WHERE m.medicine_name = 'Aspirin 81mg'
);

-- Query 4: Aggregate Function (GROUP BY)
SELECT 
	d.specialization,
    COUNT(a.appointment_id) AS total_appointments
    FROM Doctors d 
    INNER JOIN Appointments a
		ON d.doctor_id = a.doctor_id 
	GROUP BY d.specialization;
    
-- Query 5: Update and delte statements
-- Update 
	UPDATE Appointments 
    SET status = 'Completed'
    WHERE appointment_id = 1; 
    
    SELECT * 
    FROM Appointments 
    WHERE appointment_id = 1;
    
    -- Delete 
	DELETE FROM Payments 
    WHERE payment_id = 5; 
    
    SELECT *
    FROM Payments; 
    
-- 6. VIEW
CREATE VIEW Patient_Appointment_View AS 
SELECT 
	p.patient_id,
    p.first_name,
	p.last_name, 
    a.appointment_date,
    a.appointment_time, 
	a.status, 
	d.specialization
FROM Patients p 
JOIN Appointments a 
	ON p.patient_id = a.patient_id
JOIN Doctors d 
	ON a.doctor_id = d.doctor_id; 
  
	-- TEST VIEW:
SELECT * FROM Patient_Appointment_View;


-- 7. TRIGGER: 
DELIMITER // 

CREATE TRIGGER prevent_negative_stock
BEFORE UPDATE ON Medicine 
FOR EACH ROW 
BEGIN 
	IF NEW.stock_quantity < 0 THEN 
		SET NEW.stock_quantity = 0;
	END IF; 
END // 

DELIMITER ;	

	-- TEST TRIGGER:
UPDATE Medicine 
SET stock_quantity = -10
WHERE medicine_id = 1;

SELECT medicine_id, medicine_name, stock_quantity
FROM Medicine 
WHERE medicine_id = 1; 