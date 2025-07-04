CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    gender CHAR(1),
    dob DATE,
    phone VARCHAR(15),
    address VARCHAR(255)
);

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    specialization VARCHAR(50),
    phone VARCHAR(15)
);

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    diagnosis VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE treatments (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT,
    treatment_description VARCHAR(255),
    medicine VARCHAR(100),
    cost DECIMAL(10,2),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

CREATE TABLE bills (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    total_amount DECIMAL(10,2),
    bill_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

INSERT INTO patients (name, gender, dob, phone, address) VALUES
('Emily Johnson', 'F', '1985-06-15', '555-2001', '123 Elm St'),
('Michael Davis', 'M', '1992-11-20', '555-2002', '456 Pine St'),
('Sophia Williams', 'F', '2000-03-05', '555-2003', '789 Oak St');

INSERT INTO doctors (name, specialization, phone) VALUES
('Dr. John Smith', 'Cardiology', '555-1000'),
('Dr. Alice Brown', 'Neurology', '555-1001'),
('Dr. David Lee', 'Pediatrics', '555-1002');

INSERT INTO appointments (patient_id, doctor_id, appointment_date, diagnosis) VALUES
(1, 1, '2025-07-01', 'High Blood Pressure'),
(2, 2, '2025-07-02', 'Migraine'),
(3, 3, '2025-07-03', 'Fever'),
(1, 1, '2025-07-10', 'Routine Check-up');

INSERT INTO treatments (appointment_id, treatment_description, medicine, cost) VALUES
(1, 'Blood pressure medication', 'Amlodipine', 50.00),
(2, 'Pain relief medication', 'Ibuprofen', 30.00),
(3, 'Fever reducer', 'Paracetamol', 20.00),
(4, 'General health check', 'Multivitamins', 25.00);

INSERT INTO bills (patient_id, total_amount, bill_date) VALUES
(1, 75.00, '2025-07-10'),
(2, 30.00, '2025-07-02'),
(3, 20.00, '2025-07-03');

SELECT * FROM patients;
SELECT * FROM doctors;
SELECT * FROM appointments;
SELECT * FROM treatments;
SELECT * FROM bills;

SELECT name, specialization from doctors;

SELECT * FROM appointments
WHERE appointment_date >= '2025-07-02';

SELECT count(*) AS total_patients FROM patients; 


SELECT a.appointment_id, p.name AS patient, d.name as doctor, a.appointment_date, a.diagnosis
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_idpatients
JOIN doctors d ON a.doctor_id = d.doctor_id;

SELECT SUM(total_amount) AS total_revenue FROM bills;

SELECT * FROM patients
WHERE address LIKE '%Elm St%';


