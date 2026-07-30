-- Insert Data into Staff
INSERT INTO Staff (first_name, last_name, role, phone, email) VALUES
('Ahmed', 'Almansour', 'Doctor', '0501234567','ahmed@clinic.com'),
('Sarah', 'Alotaibi', 'Doctor', '0507654321', 'sarah@clinic.com'),
('Noura', 'Alsudairy', 'Receptionist', '0500001122', 'noura@clinic.com'),
('Khalid', 'Alenazi', 'Doctor', '0509998877', 'khalid.e@clinic.com'),
('Layan', 'Alharbi', 'Receptionist', '0508887766', 'layan@clinic.com'),
('Faisal', 'Alotaibi', 'Doctor', '0505556677', 'faisal@clinic.com'),
('Amal', 'Alshahrani', 'Doctor', '0504443322', 'amal@clinic.com');

-- Insert Data into Doctors
INSERT INTO Doctors (doctor_id, specialization, license_number) VALUES
(1, 'Cardiology', 'LIC12345'),
(2, 'Pediatrics', 'LIC67890'),
(4, 'Dermatology', 'LIC55443'),
(6, 'Neurology', 'LIC99887'),
(7, 'Gynecology', 'LIC77665');

-- Insert Date into Patients
INSERT INTO Patients (first_name, last_name, date_of_birth, gender, phone, email) VALUES
('Khalid', 'Alharbi', '1990-05-12', 'Male','0555554433', 'khalid@mail.com'),
('Maha', 'Alghamdi', '1995-10-22', 'Female', '0544443322', 'maha@mail.com'),
('Fahad', 'Aldossari', '1988-01-15', 'Male', '0533332211', 'fahad@mail.com'),
('Rayan', 'Almutairi', '2000-08-30', 'Female', '0566667788', 'rayan@mail.com'),
('Aisha', 'Algahtani', '1993-04-05', 'Male', '0577778899', 'aisha@mail.com');

-- Insert Data into Appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, status) VALUES
(1, 1, '2026-07-15', '10:00:00', 'Scheduled'),
(2, 2, '2026-07-16', '14:30:00', 'Scheduled'),
(3, 1, '2026-07-12', '09:00:00', 'Completed'),
(4, 4, '2026-07-18', '11:15:00', 'Scheduled'),
(5, 2, '2026-07-19', '16:00:00', 'No Show');

-- Insert Data into Payments
INSERT INTO Payments (patient_id, amount, payment_date, payment_method) VALUES
(3, 250.00, '2026-07-12', 'Credit Card'),
(1, 150.00, '2026-07-15', 'Cash'),
(2, 200.00, '2026-07-16', 'Apple Pay'),
(4, 350.00, '2026-07-18', 'Credit Card'),
(5, 150.00, '2026-07-19', 'Mada');

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
INSERT INTO Treatment_Medicine (treatment_id, medicine_id, dosage, instructions) VALUES
(1, 1, '81mg', 'Take 1 tablet daily with food'),
(2, 2, '1 tablet', 'Take 1 chewable tablet daily'),
(3, 3, '50mg', 'Take 1 tablet every morning'),
(4, 4, 'Apply twice daily', 'Apply thin layer to affected skin'),
(5, 5, '400mg', 'Take 1 tablet every 8 hours as needed');

-- Show Data
SELECT * FROM Staff;
SELECT * FROM Doctors;
SELECT * FROM Patients;
SELECT * FROM Appointments;
SELECT * FROM Payments;
SELECT * FROM Treatments;
SELECT * FROM Medicine;
SELECT * FROM Treatment_Medicine;
