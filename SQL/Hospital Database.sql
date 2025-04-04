CREATE DATABASE Hospital_DataBase;
USE Hospital_DataBase;

# PATIENT'S 
CREATE TABLE Patient (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    MiddleName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20),
    Allergies TEXT
);

# EMERGENCY CONTACT
CREATE TABLE EmergencyContact (
    ContactID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    Name VARCHAR(100),
    ContactInfo VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID) ON DELETE CASCADE
);

# MEDICAL STAFF 
CREATE TABLE Medical_Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Role VARCHAR(50), -- e.g., Doctor, Nurse
    Specialization VARCHAR(100), -- e.g., Cardiology, Oncology
    Certifications TEXT
);

# DEPARTMENT 
CREATE TABLE Department (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    Location VARCHAR(255)
);

# MEDICAL STAFF TO DEPARTMENT RELATIONSHIP (Many-to-Many)
CREATE TABLE StaffDepartment (
    StaffID INT,
    DepartmentID INT,
    PRIMARY KEY (StaffID, DepartmentID),
    FOREIGN KEY (StaffID) REFERENCES Medical_Staff(StaffID) ON DELETE CASCADE,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID) ON DELETE CASCADE
);

# APPOINTMENT 
CREATE TABLE Appointment (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    StaffID INT,
    AppointmentDate DATE,
    AppointmentTime TIME,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID) ON DELETE CASCADE,
    FOREIGN KEY (StaffID) REFERENCES Medical_Staff(StaffID) ON DELETE CASCADE
);

# MEDICAL RECORD 
CREATE TABLE MedicalRecord (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    Diagnosis TEXT,
    Treatment TEXT,
    Medication TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID) ON DELETE CASCADE
);

# WARD
CREATE TABLE Ward (
    WardID INT AUTO_INCREMENT PRIMARY KEY,
    WardName VARCHAR(100),
    Capacity INT
);

# PATIENT WARD ADMISSION 
CREATE TABLE PatientWard (
    AdmissionID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    WardID INT,
    AdmissionDate DATE,
    DischargeDate DATE NULL,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID) ON DELETE CASCADE,
    FOREIGN KEY (WardID) REFERENCES Ward(WardID) ON DELETE CASCADE
);

# TABLE FOR INSURANCE PROVIDER
CREATE TABLE InsuranceProvider (
    ProviderID INT AUTO_INCREMENT PRIMARY KEY,
    ProviderName VARCHAR(100),
    PolicyNumber VARCHAR(50) UNIQUE
);

# RELATIONSHIP BETWEEN PATIENTS AND INSURANCE (Many-to-Many)
CREATE TABLE PatientInsurance (
    PatientID INT,
    ProviderID INT,
    PRIMARY KEY (PatientID, ProviderID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID) ON DELETE CASCADE,
    FOREIGN KEY (ProviderID) REFERENCES InsuranceProvider(ProviderID) ON DELETE CASCADE
);


# FILLING PATIENT DETAILS
INSERT INTO Patient (FirstName, MiddleName, LastName, DateOfBirth, Gender, Address, PhoneNumber, Allergies)
VALUES
('Gregory', 'A.', 'Doe', '1990-05-10', 'Male', '123 Main St', '123-456-7890', 'Peanuts'),
('Jalhy', 'B.', 'Smith', '1985-08-21', 'Female', '456 Oak St', '987-654-3210', 'None'),
('Alice', 'C.', 'Brown', '2000-11-15', 'Female', '789 Pine St', '555-123-4567', 'Penicillin'),
('Brandon', 'D.', 'Johnson', '1995-03-05', 'Male', '321 Maple St', '444-789-1234', 'Latex'),
('Charles', 'E.', 'White', '1988-12-30', 'Male', '987 Birch St', '333-567-8901', 'None'),
('Diana', 'F.', 'Green', '1993-06-25', 'Female', '654 Elm St', '222-345-6789', 'Dust'),
('Evie', 'G.', 'Black', '1997-09-14', 'Female', '159 Willow St', '111-222-3333', 'None'),
('French', 'H.', 'Miller', '1982-01-10', 'Male', '753 Ash St', '666-444-2222', 'Pollen'),
('Leila', 'I.', 'Taylor', '1999-04-18', 'Female', '852 Redwood St', '777-888-9999', 'Shellfish'),
('Hanson', 'J.', 'Anderson', '2001-07-29', 'Male', '951 Cedar St', '123-321-1234', 'None');

# DETAILS FOR MEDICAL STAFF 
INSERT INTO Medical_Staff (FirstName, LastName, Role, Specialization, Certifications)
VALUES
('Dr. Mary', 'Williams', 'Doctor', 'Cardiology', 'Board Certified'),
('Dr. Francis', 'Brown', 'Doctor', 'Oncology', 'Board Certified'),
('Nurse Emily', 'Davis', 'Nurse', 'Pediatrics', 'Registered Nurse'),
('Dr. Bless', 'Johnson', 'Doctor', 'Orthopedics', 'Board Certified'),
('Dr. Lauretta', 'Wilson', 'Doctor', 'Neurology', 'Board Certified'),
('Nurse Maybel', 'Martinez', 'Nurse', 'Emergency Medicine', 'Registered Nurse'),
('Dr. Robby', 'Moore', 'Doctor', 'Dermatology', 'Board Certified'),
('Nurse Baker', 'Taylor', 'Nurse', 'Maternity', 'Registered Nurse'),
('Dr. Liam', 'Harris', 'Doctor', 'General Medicine', 'Board Certified'),
('Dr. Lindsey', 'Clark', 'Doctor', 'Psychiatry', 'Board Certified');

#VALUES INTO DEPARTMENTS
INSERT INTO Department (DepartmentName, Location)
VALUES
('Cardiology', 'Building A'),
('Gynaecology', 'Building B'),
('Pediatrics', 'Building C'),
('Oncology', 'Building D'),
('Neurology', 'Building E'),
('Emergency', 'Building F');

# PATIENT APPOINTMENTS
INSERT INTO Appointment (PatientID, StaffID, AppointmentDate, AppointmentTime)
VALUES
(1, 1, '2025-04-01', '09:00:00'),
(2, 2, '2025-04-02', '10:30:00'),
(3, 3, '2025-04-03', '14:00:00'),
(4, 4, '2025-04-04', '11:00:00'),
(5, 5, '2025-04-05', '13:45:00'),
(6, 6, '2025-04-06', '15:30:00'),
(7, 7, '2025-04-07', '08:15:00'),
(8, 8, '2025-04-08', '16:45:00'),
(9, 9, '2025-04-09', '12:00:00'),
(10, 10, '2025-04-10', '17:30:00');

# WARDS
INSERT INTO Ward (WardName, Capacity)
VALUES
('Cardiac Care', 10),
('Gynaecologyy Ward', 12),
('Pediatric Ward', 15),
('Oncology Ward', 8),
('Neurology Ward', 10),
('General Ward', 20);

INSERT INTO MedicalRecord (PatientID, Diagnosis, Treatment, Medication)
VALUES
(1, 'Hypertension', 'Lifestyle changes and medication', 'Lisinopril'),
(2, 'Diabetes Type 2', 'Insulin therapy and diet control', 'Metformin'),
(3, 'Asthma', 'Inhaler therapy', 'Albuterol'),
(4, 'Fractured Leg', 'Surgery and physiotherapy', 'Painkillers'),
(5, 'Migraine', 'Pain management and stress reduction', 'Ibuprofen'),
(6, 'COVID-19', 'Isolation and antiviral treatment', 'Remdesivir'),
(7, 'Anemia', 'Iron supplements and dietary changes', 'Ferrous sulfate'),
(8, 'Pneumonia', 'Antibiotics and oxygen therapy', 'Amoxicillin'),
(9, 'Kidney Stones', 'Pain management and hydration', 'Tamsulosin'),
(10, 'Depression', 'Cognitive therapy and medication', 'Sertraline');

INSERT INTO InsuranceProvider (ProviderName, PolicyNumber)
VALUES
('BlueCross BlueShield', 'BC123456'),
('UnitedHealth Group', 'UH654321'),
('Aetna', 'AET987654'),
('Cigna', 'CIG135790'),
('Kaiser Permanente', 'KP246810'),
('Humana', 'HUM112233'),
('Medicare', 'MED445566'),
('Medicaid', 'MCD778899'),
('Tricare', 'TRI990011'),
('Oscar Health', 'OSC332211');

INSERT INTO PatientWard (PatientID, WardID, AdmissionDate, DischargeDate) 
VALUES (1, 1, '2025-04-01', NULL),
       (2, 2, '2025-04-02', NULL),
       (3, 3, '2025-04-02', '2025-04-12'),
         (4, 4, '2025-04-04', '2025-05-02');


SELECT * FROM Patient;

SELECT * FROM Medical_Staff;

SELECT * FROM Department;

SELECT * FROM Appointment;

SELECT * FROM Ward;

SELECT * FROM PatientWard;

SELECT * FROM InsuranceProvider;

SELECT * FROM MedicalRecord;

##All upcoming appointments for a given patient (retrieves patients who are still admitted in the hospital)
SELECT Patient.FirstName, Patient.LastName, Appointment.AppointmentDate, Appointment.AppointmentTime, Medical_Staff.FirstName AS DoctorName
FROM Appointment
JOIN Patient ON Appointment.PatientID = Patient.PatientID
JOIN Medical_Staff ON Appointment.StaffID = Medical_Staff.StaffID
WHERE Appointment.AppointmentDate > CURRENT_DATE
ORDER BY Appointment.AppointmentDate ASC;

## Number of appointments per doctor per day
SELECT Medical_Staff.StaffID, Medical_Staff.FirstName, Medical_Staff.LastName, Appointment.AppointmentDate, COUNT(*) AS AppointmentCount
FROM Appointment
JOIN Medical_Staff ON Appointment.StaffID = Medical_Staff.StaffID
GROUP BY Medical_Staff.StaffID, Appointment.AppointmentDate
ORDER BY Appointment.AppointmentDate DESC;

## All patients who are currently admitted in a ward
SELECT Patient.PatientID, Patient.FirstName, Patient.LastName, Ward.WardName
FROM Patient
JOIN PatientWard ON Patient.PatientID = PatientWard.PatientID
JOIN Ward ON PatientWard.WardID = Ward.WardID
WHERE PatientWard.DischargeDate IS NULL;


##DROP DATABASE Hospital_DataBase
