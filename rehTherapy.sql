--rehtsira
use master
go
drop database rehTherapy
go  
create database rehTherapy
go
use rehTherapy
go

--CREATING TABLES
create table patient (
patientID int identity primary key,
firstName nvarchar(50) not null,
lastName nvarchar(50) not null,
phoneNumber bigint not null,
birthDate date not null,
streetAddress nvarchar(60) not null,
City nvarchar(60) not null,
[state] nvarchar(60) not null,
zipCode int not null,
);

--NOTE: Two physical therapy facilities are called 'Ris' and 'Aer'
create table facility (
facilityID int identity primary key,
facilityName nvarchar(50) not null,
streetAddress nvarchar(60) not null,
[state] nvarchar(60) not null,
city nvarchar(60) not null,
zipCode int not null,
check(facilityName in ('Ris','Aer')),
);

create table physician (
physicianID int identity primary key,
firstName nvarchar(50) not null,
lastName nvarchar(50) not null,
birthDate date not null,
streetAddress nvarchar(60) not null,
[state] nvarchar(60) not null,
city nvarchar(60) not null,
zipCode int not null,
phoneNumber bigint not null,
facilityID int not null references facility(facilityID),
);

create table appointment (
appointmentID int identity primary key,
appointmentDate date not null,
issue nvarchar(50),
patientID int not null references patient(patientID),
physicianID int not null references physician(physicianID)
);

create table diagnosis (
diagnosisID int identity primary key,
treatment nvarchar(75),
category nvarchar(50),
appointmentID int not null references appointment(appointmentID)
);

create table insurance (
insuranceID int identity primary key,
companyName nvarchar(60) not null,
streetAddress nvarchar(60) not null,
[state] nvarchar(60) not null,
city nvarchar(60) not null,
zipCode int not null,
phoneNumber bigint not null,
category nvarchar(60) not null,
);

create table bill (
billID int identity primary key,
amount int,
issuedDate date not null,
dueDate date not null,
appointmentID int not null references appointment(appointmentID),
insuranceID int not null references insurance(insuranceID)
);

create table patientphysician (
patientID int not null references patient(patientID),
physicianID int not null references physician(physicianID)
primary key (patientID,physicianID)
);

--CREATING INDEXES
create index idx_patient_lastname on patient(lastname);
create index idx_physician_lastname on physician(lastname);
create index idx_appointment_issue on appointment(issue);
create unique index idx_facility_facilityname on facility(facilityname);
create unique index idx_insurance_companyname on insurance(companyname);

--facilities
insert into facility (facilityName,streetAddress,[state],city,zipcode)
values ('Ris','111 Ave','New York','New York City','00001');
insert into facility (facilityName,streetAddress,[state],city,zipcode)
values ('Aer','222 Ave','New York','New York City','00002');

--physicians
insert into physician (firstName,lastName,birthdate,streetAddress,[state],city,zipCode,phoneNumber,facilityID) 
values ('A','A','2000-01-01','1 A','New York','New York City','11111', '1111111111','1');

insert into physician (firstName,lastName,birthdate,streetAddress,[state],city,zipCode,phoneNumber,facilityID)
values ('B','B','2000-02-02','1 B','New York','New York City','11111','1111111112','1');

insert into physician (firstName,lastName,birthdate,streetAddress,[state],city,zipCode,phoneNumber,facilityID) 
values ('C','C','2000-03-03','1 C','New York','New York City','11111', '1111111113','1');

insert into physician (firstName,lastName,birthdate,streetAddress,[state],city,zipCode,phoneNumber,facilityID)
values ('D','D','2000-04-04','1 D','New York','New York City','11111','1111111114','2');

insert into physician (firstName,lastName,birthdate,streetAddress,[state],city,zipCode,phoneNumber,facilityID)
values ('E','E','2000-05-05','1 E','New York','New York City','11111','1111111115','2');

--patients
insert into patient (firstName,lastName,phoneNumber,birthDate,streetAddress,City,[state],zipCode)
values ('F','F','1111111116','2000-06-06','1 F','New York City','New York','11111');

insert into patient (firstName,lastName,phoneNumber,birthDate,streetAddress,City,[state],zipCode)
values ('G','G','1111111117','2000-07-07','1 G','New York City','New York','11111');

insert into patient (firstName,lastName,phoneNumber,birthDate,streetAddress,City,[state],zipCode)
values ('H','H','1111111118','2000-08-08','1 H','New York City','New York','11111');

insert into patient (firstName,lastName,phoneNumber,birthDate,streetAddress,City,[state],zipCode)
values ('I','I','1111111119','2000-09-09','1 I','New York City','New York','11111');

insert into patient (firstName,lastName,phoneNumber,birthDate,streetAddress,City,[state],zipCode)
values ('J','J','1111111110','2000-10-10','1 J','New York City','New York','11111');

--junction between physician and patient
insert into patientphysician (physicianID,patientID)
values ('1','1');

insert into patientphysician (physicianID,patientID)
values ('2','2');

insert into patientphysician (physicianID,patientID)
values ('3','3');

insert into patientphysician (physicianID,patientID)
values ('4','4');

insert into patientphysician (physicianID,patientID)
values ('5','5');

insert into patientphysician (physicianID,patientID)
values ('1','5');

insert into patientphysician (physicianID,patientID)
values ('2','4');

insert into patientphysician (physicianID,patientID)
values ('3','1');

insert into patientphysician (physicianID,patientID)
values ('4','2');

insert into patientphysician (physicianID,patientID)
values ('5','3');

--appointments
insert into appointment(appointmentDate,Issue,patientID,physicianID)
values ('2019-04-20','concussion','1','4');

insert into appointment(appointmentDate,Issue,patientID,physicianID)
values ('2019-04-20','osteoarthritis','2','3');

insert into appointment(appointmentDate,Issue,patientID,physicianID)
values ('2019-04-19','Weak joints','3','5');

insert into appointment(appointmentDate,Issue,patientID,physicianID)
values ('2019-04-22','back pain','4','5');

insert into appointment(appointmentDate,Issue,patientID,physicianID)
values ('2019-04-22','carpal tunnel','5','4');

--diagnoses
insert into diagnosis(category,treatment,appointmentID)
values ('muscular weakness','muscle strenghtening exercises','1');

insert into diagnosis(category,treatment,appointmentID)
values ('sprains','ultrasound','2');

insert into diagnosis(category,treatment,appointmentID)
values ('injured tissue','electrical stimulation','3');

insert into diagnosis(category,treatment,appointmentID)
values ('sprains','neuromuscular electrical stimulation','4');

insert into diagnosis(category,treatment,appointmentID)
values ('back pain','traction','5');

--insurances
insert into insurance(companyName,streetAddress,city,[state],zipcode,phoneNumber,category)
values ('Unitedhealth','12501 Whitewater Dr','Hopkins','Minnesota','55343','8885455205','MedicAid');

insert into insurance(companyName,streetAddress,city,[state],zipcode,phoneNumber,category)
values ('Centene Corp','1150 Connecticut Ave','Washington','D.C','20036','2022238010','Medicare');

insert into insurance(companyName,streetAddress,city,[state],zipcode,phoneNumber,category)
values ('Coventry','6720-B Rockledge Drive','Bethesda','Maryland','20817','3015810600','Medicare');

insert into insurance(companyName,streetAddress,city,[state],zipcode,phoneNumber,category)
values ('Blue Cross Blue Shield of Western New York','257 W Genesse St','Buffalo','New York','14202','7168876900','Medicare');

insert into insurance(companyName,streetAddress,city,[state],zipcode,phoneNumber,category)
values ('Highmark','120 Fifth Ave','Pittsburgh','Pennsylvania','15222','4125447000','Medicaid');

--bills
insert into bill(amount,issuedDate,dueDate,appointmentID,insuranceID)
values ('100','2019-03-06','2019-04-10','1','1');

insert into bill(amount,issuedDate,dueDate,appointmentID,insuranceID)
values ('2049','2019-04-28','2019-05-20','2','2');

insert into bill(amount,issuedDate,dueDate,appointmentID,insuranceID)
values ('3089','2019-05-05','2019-06-10','3','3');

insert into bill(amount,issuedDate,dueDate,appointmentID,insuranceID)
values ('408','2019-05-05','2019-04-10','4','4');

insert into bill(amount,issuedDate,dueDate,appointmentID,insuranceID)
values ('5012','2019-05-05','2019-04-10','5','5');

select * from physician
select * from patient
select * from bill
select * from appointment
select * from insurance
select * from facility
select * from patientphysician
select * from diagnosis

--PROCEDURES

--Update patient's treatment
go
create procedure updatetreatment
@treatment nvarchar(80),
@firstname nvarchar(50),
@lastname nvarchar(50)
AS
BEGIN
update diagnosis
set treatment=@treatment
from diagnosis d
	join appointment a on a.appointmentid=d.appointmentid
	join patient p on p.patientID=a.patientID
where p.firstName=@firstname and p.lastName=@lastname
END;
go

exec updatetreatment @treatment='back massage',@firstname='A',@lastname='A';
exec updatetreatment @treatment='physical exercise',@firstname='B',@lastname='B';

--Look up patient's name given patientID
go
create procedure patientidlookup
@patientID int,
@first_name nvarchar(50) OUTPUT,
@last_name nvarchar(50) OUTPUT
as
begin
select p.firstname,p.lastname,pp.patientID from patient p join patientphysician pp
on pp.patientID=p.patientID
where p.patientID=@patientID
END;
go

Declare @first_name nvarchar(50);
Declare @last_name nvarchar(50);
exec patientidlookup @patientID='3', @first_name=@first_name,@last_name=@last_name;

--Remove patient from database given patientID
go
create procedure removepatient
@pppatient_id int
AS
BEGIN
delete from patientphysician where patientID=@pppatient_id
END;
go
exec removepatient @pppatient_id='149'
select * from patient;
select * from patientphysician;

--Remove patients given their first name and last name
go
create procedure removepatientpeople
@first_name nvarchar(50),
@last_name nvarchar(50)
AS
BEGIN
delete from patient where firstname=@first_name and lastName=@last_name
END;
go

exec removepatientpeople @first_name='C', @last_name='C';

--Insert new patient with their corresponding physician
go
create procedure newpatient
@PA_firstName nvarchar(50),
@PA_lastName nvarchar(50),
@PA_PHONE bigint,
@PA_birthDate date,
@PA_streetAddress nvarchar(60),
@PA_City nvarchar(60),
@PA_state nvarchar(60),
@PA_zipCode int,
@PH_physicianID int,
@PH_patientID int
AS
BEGIN
insert into patient (firstName,lastName,phoneNumber,
birthDate,streetAddress,City,state,zipCode)
values (@PA_firstName,@PA_lastName,@PA_PHONE,@PA_birthDate,@PA_streetAddress,@PA_City,@PA_state,@PA_zipCode)
insert into patientphysician(physicianID,patientID)
values (@PH_physicianID,SCOPE_IDENTITY());
END;
go

Declare @PH_patientID int;
exec newpatient @PA_firstname = 'Z',@PA_lastname='Z',@PA_PHONE = '1111111121',@PA_Birthdate ='2000-12-12',
@PA_StreetAddress='Z S',@PA_City='New York City',@PA_state='New York',@PA_Zipcode='11111',@PH_patientID=@PH_patientID
,@PH_PhysicianID='3';
select * from patient;

-- CREATING VIEWS

--View for viewing patient treatments
go
create view patienttreatment as
select p.firstName, d.treatment
from patient p join appointment a on a.patientID=p.patientID
join diagnosis d on d.appointmentID=a.appointmentID
go

select * from patienttreatment

--View for viewing patient's issue and their appointment date along with their corresponding physician
go
create view patientappointments as
select p.firstName as 'Patient First Name', p.lastName as 'Patient Last Name', ph.firstName as 'Physician First Name', ph.lastName as 'Physician Last Name',
a.appointmentDate as 'Appointment Date', a.Issue as 'Patient Issue'
from appointment a 
join patient p on p.patientID=a.patientID
join physician ph on ph.physicianID=a.physicianID
go

select * from patientappointments;

--View for viewing the amount the insurance owe while also including the patient's name and the corresponding physician.
go
create view insuranceowe as
select b.amount,i.companyName as Insurance,p.firstName as 'Patient First Name',p.lastName as 'Patient Last Name',ph.firstname as 'Physician First Name',ph.lastname as 'Physician Last Name'from appointment a
join bill b on b.appointmentID=a.appointmentID
join insurance i on i.insuranceID=a.appointmentID
join patient p on p.patientID=a.patientID
join physician ph on ph.physicianID=a.physicianID
go

select * from insuranceowe

--View Ris physicians
go
create view risPhysicians as
select f.facilityname, p.firstname, p.lastname as physician
from facility f join physician p on f.facilityID=p.facilityID
where f.facilityName='Ris';
go

select * from risPhysicians

--View for viewing Aer physicians
go
create view aerPhysicians as
select f.facilityname, p.firstname, p.lastname as physician
from facility f join physician p on f.facilityID=p.facilityID
where f.facilityName='Aer';
go

select * from aerPhysicians

--View for viewing which patients go to which facility
go
create view facilitylist as
select p.firstName as 'Patient First Name',p.lastName as 'Patient Last Name',ph.firstName AS 'Physician First Name', ph.lastName AS 'Physician Last Name',
f.facilityName as 'Facility Name'
from patient p join patientphysician pp on pp.patientID=p.patientID
join physician ph on ph.physicianID=pp.physicianID
join facility f on f.facilityID=ph.facilityID
go

select * from facilitylist;