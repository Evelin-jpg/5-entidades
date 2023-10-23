-- Employee
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    MiddleName VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Gender CHAR(1) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Address VARCHAR(100) NOT NULL,
    ZipCode VARCHAR(10) NOT NULL,
    RFC VARCHAR(13) NOT NULL,
    SocialSecurity VARCHAR(15) NOT NULL,
    EmployeeTypeID INT NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- EmployeeType
CREATE TABLE EmployeeType (
    EmployeeTypeID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    BaseSalary DECIMAL(10, 2) NOT NULL,
    Hours INT NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- Career
CREATE TABLE Career (
    CareerID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL,
    Description VARCHAR(100) NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);
-- DocumentRequest
CREATE TABLE DocumentRequest (
    DocumentRequestID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT NOT NULL,
    DocumentTypeID INT NOT NULL,
    EmployeeID INT NOT NULL,
    RequestDate DATE NOT NULL
);

-- DocumentType
CREATE TABLE DocumentType (
    DocumentTypeID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL,
    Description VARCHAR(100) NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);
-- Foreign Keys
-- Employee
ALTER TABLE Employee
ADD CONSTRAINT FK_EmployeeEmployeeType FOREIGN KEY (EmployeeTypeID) REFERENCES EmployeeType (EmployeeTypeID);

-- StudyPlan
ALTER TABLE StudyPlan
ADD CONSTRAINT FK_StudyPlanCareer FOREIGN KEY (CareerID) REFERENCES Career (CareerID);

-- Class
ALTER TABLE Class
ADD CONSTRAINT FK_ClassEmployee FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID);

ALTER TABLE Class
ADD CONSTRAINT FK_ClassCourse FOREIGN KEY (CourseID) REFERENCES Course (CourseID);

ALTER TABLE Class
ADD CONSTRAINT FK_ClassPeriod FOREIGN KEY (PeriodID) REFERENCES Period (PeriodID);

-- Kardex
ALTER TABLE Kardex
ADD CONSTRAINT FK_KardexClass FOREIGN KEY (ClassID) REFERENCES Class (ClassID);

ALTER TABLE Kardex
ADD CONSTRAINT FK_KardexOpportunity FOREIGN KEY (OpportunityID) REFERENCES Opportunity (OpportunityID);

ALTER TABLE Kardex
ADD CONSTRAINT FK_KardexStudent FOREIGN KEY (StudentID) REFERENCES Student (StudentID);

-- CareerService
ALTER TABLE CareerService
ADD CONSTRAINT FK_CareerServiceCareer FOREIGN KEY (CareerID) REFERENCES Career (CareerID);

ALTER TABLE CareerService
ADD CONSTRAINT FK_CareerServiceEmployee FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID);

-- DocumentRequest
ALTER TABLE DocumentRequest
ADD CONSTRAINT FK_DocumentRequestStudent FOREIGN KEY (StudentID) REFERENCES Student (StudentID);

ALTER TABLE DocumentRequest
ADD CONSTRAINT FK_DocumentRequestDocumentType FOREIGN KEY (DocumentTypeID) REFERENCES DocumentType (DocumentTypeID);

ALTER TABLE DocumentRequest
ADD CONSTRAINT FK_DocumentRequestEmployee FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID);

-- InstitutionalScholar
ALTER TABLE InternalScholar
ADD CONSTRAINT FK_InternalScholarInstitutionalScholar FOREIGN KEY (InstitutionalScholarshipID) REFERENCES InstitutionalScholarship (InstitutionalScholarshipID);

ALTER TABLE InternalScholar
ADD CONSTRAINT FK_InternalScholarStudent FOREIGN KEY (StudentID) REFERENCES Student (StudentID);

-- ExternalScholar
ALTER TABLE ExternalScholar
ADD CONSTRAINT FK_ExternalScholarStudent FOREIGN KEY (StudentID) REFERENCES Student (StudentID);

ALTER TABLE ExternalScholar
ADD CONSTRAINT FK_ExternalScholarSUBES FOREIGN KEY (SUBESID) REFERENCES SUBES (SUBESID);


-- Enrollment
ALTER TABLE Enrollment
ADD CONSTRAINT FK_EnrollmentStudent FOREIGN KEY (StudentID) REFERENCES Student (StudentID);

ALTER TABLE Enrollment
ADD CONSTRAINT FK_EnrollmentPeriod FOREIGN KEY (PeriodID) REFERENCES Period (PeriodID);


-- Reticule
ALTER TABLE Reticule
ADD CONSTRAINT FK_ReticuleCourse FOREIGN KEY (CourseID) REFERENCES Course (CourseID);

-- Student
ALTER TABLE Student
ADD CONSTRAINT FK_StudentStudyPlan FOREIGN KEY (StudyPlanID) REFERENCES StudyPlan (StudyPlanID);

ALTER TABLE Student
ADD CONSTRAINT FK_StudentStudyCertificate FOREIGN KEY (StudyCertificateID) REFERENCES StudyCertificate (StudyCertificateID);

ALTER TABLE Student
ADD CONSTRAINT FK_StudentTitle FOREIGN KEY (TitleID) REFERENCES Title (TitleID);

ALTER TABLE Student
ADD CONSTRAINT FK_StudentLifeInsurance FOREIGN KEY (LifeInsuranceID) REFERENCES LifeInsurance (LifeInsuranceID);

ALTER TABLE Student
ADD CONSTRAINT FK_StudentEducation FOREIGN KEY (EducationID) REFERENCES Education (EducationID);

ALTER TABLE Student
ADD CONSTRAINT FK_StudentCertificate FOREIGN KEY (CertificateID) REFERENCES StudyCertificate (StudyCertificateID);

CREATE INDEX IX_Employee ON Employee (EmployeeID);
CREATE INDEX IX_EmployeeType ON EmployeeType (EmployeeTypeID);
CREATE INDEX IX_Career ON Career (CareerID);

CREATE INDEX IX_DocumentRequest ON DocumentRequest (DocumentRequestID);
CREATE INDEX IX_DocumentType ON DocumentType (DocumentTypeID);

INSERT INTO EmployeeType (Name, BaseSalary, Hours)
VALUES ('Full-Time', 50000.00, 40);

INSERT INTO EmployeeType (Name, BaseSalary, Hours)
VALUES ('Part-Time', 25000.00, 20);

INSERT INTO EmployeeType (Name, BaseSalary, Hours)
VALUES ('Contract', 35000.00, 30);

INSERT INTO Employee (FirstName, LastName, MiddleName, PhoneNumber, Email, Gender, Position, Salary, DateOfBirth, Address, ZipCode, RFC, SocialSecurity, EmployeeTypeID)
VALUES ('John', 'Doe', 'A', '123-456-7890', 'john.doe@email.com', 'M', 'Manager', 60000.00, '1990-05-15', '123 Main St', '12345', 'ABC123456DEF', '123-45-6789', 1);

INSERT INTO Employee (FirstName, LastName, MiddleName, PhoneNumber, Email, Gender, Position, Salary, DateOfBirth, Address, ZipCode, RFC, SocialSecurity, EmployeeTypeID)
VALUES ('Jane', 'Smith', 'B', '987-654-3210', 'jane.smith@email.com', 'F', 'Assistant', 40000.00, '1995-09-20', '456 Elm St', '54321', 'XYZ987654ABC', '987-65-4321', 2);

INSERT INTO Employee (FirstName, LastName, MiddleName, PhoneNumber, Email, Gender, Position, Salary, DateOfBirth, Address, ZipCode, RFC, SocialSecurity, EmployeeTypeID)
VALUES ('David', 'Williams', 'C', '555-123-9876', 'david.williams@email.com', 'M', 'Developer', 55000.00, '1988-03-10', '789 Oak St', '67890', 'PQR555123XYZ', '555-12-3987', 1);


INSERT INTO Career (Name, Description)
VALUES ('Computer Science', 'Programs for the computer science field.');

INSERT INTO Career (Name, Description)
VALUES ('Business Administration', 'Programs for business management.');

INSERT INTO Career (Name, Description)
VALUES ('Mechanical Engineering', 'Programs for mechanical engineering.');

INSERT INTO DocumentType (Name, Description)
VALUES ('Transcript', 'Academic transcript document.');

INSERT INTO DocumentType (Name, Description)
VALUES ('Diploma', 'Certificate of completion.');

INSERT INTO DocumentType (Name, Description)
VALUES ('Recommendation Letter', 'Letter of recommendation.');


INSERT INTO DocumentRequest (StudentID, DocumentTypeID, EmployeeID, RequestDate)
VALUES (1, 1, 1, '2023-10-15');

INSERT INTO DocumentRequest (StudentID, DocumentTypeID, EmployeeID, RequestDate)
VALUES (2, 2, 2, '2023-10-16');

INSERT INTO DocumentRequest (StudentID, DocumentTypeID, EmployeeID, RequestDate)
VALUES (3, 3, 3, '2023-10-17');
