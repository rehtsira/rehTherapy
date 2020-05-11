# <div align="center">rehTherapy</div>
Mock physical therapy SQL Database for Database Design and Management.

<b><h1>Logical Data Model</h1></b></br>
![rehTherapy](https://github.com/rehtsira/rehtsira.github.io/blob/master/assets/img/rehtherapy.PNG)

![logicalmodel](https://github.com/rehtsira/rehTherapy/blob/master/LogicalDataModel.png)

<b><h1>Business Processes</h1></b></br>
<i>Rules describing the relationships of these entities are as follows:</i></br>
1.	A patient is someone who is being treated by the physician.
2.	A physician is someone who treats a patient.
3.	A diagnosis is something that a patient has and the physician treats.
4.	A facility is one of two physical therapy buildings where the patient gets treated by the physician.
5.	An insurance is a company who may pay a patient’s bill.
6.	A bill is how much a patient needs to pay.
7.	An appointment is when a patient visits for consultation from a physician in a facility. 

<b>Relationship Rules</b></br>

8.	A patient may consult with one or more physician.
9.	A physician may have one or more patient.

10.	A patient can make one or more appointments.
11.	An appointment may be done by a patient.

12.	An appointment must have one physician.
13.	A physician must attend one or more appointments.

14.	A physician must belong to one of two facilities.
15.	A facility must have one or more physicians.

16.	An appointment may yield one or more diagnoses.
17.	A diagnoses may result from an appointment.

18.	An appointment may create one or more bills.
19.	A bill may result from an appointment.

20.	An insurance may pay one or more bills.
21.	A bill must be paid by the insurance.

<b>Attribute Rules</b></br>

22.	A patient must have firstName, lastName, phoneNumber, birthDate, streetAddress, City, State, Zipcode, and patientID.
-	firstName: nvarchar(50)
-	lastName: nvarchar(50)
-	patientID: int
-	phoneNumber: bigint
-	birthDate: Date
-	streetAddress: nvarchar(60)
-	City: nvarchar(60)
-	State: nvarchar(60)
-	Zipcode: int
23.	A physician must have physicianID, firstName, lastName, birthDate, streetAddress, State, City, Zipcode, and phoneNumber.
-	physicianID: int
-	firstName: nvarchar(50)
-	lastName: nvarchar(50)
-	birthDate: Date
-	phoneNumber: bigint
-	streetAddress: nvarchar(60)
-	City: nvarchar(60)
-	State: nvarchar(60)
-	Zipcode: int
24.	A facility must have a facilityID, facilityName, streetAddress, City, State, and Zipcode.
-	facilityID: int
-	facilityName: nvarchar(50)
-	streetAddress: nvarchar(60)
-	City: nvarchar(60)
-	State: nvarchar(60)
-	Zipcode: int
25.	An appointment must have appointmentDate, Issue, and appointmentID.
-	appointmentDate: Date
-	Issue: nvarchar(50)
-	appointmentID: int
26.	A diagnosis must have diagnosisID, treatment, and category.
-	diagnosisID: int
-	Treatment: nvarchar(75)
-	Category: nvarchar(50)
27.	A bill must have billID, Amount, issuedDate, and dueDate.
-	billID: int
-	Amount: int
-	issuedDate: Date
-	dueDate: Date
28.	An insurance must have insuranceID, companyName, streetAddress, City, State, Zipcode, phoneNumber, and Category.
-	insuranceID: int
-	companyName: nvarchar(60)
-	streetAddress: nvarchar(60)
-	City: nvarchar(60)
-	State: nvarchar(60)
-	Zipcode: int
-	phoneNumber: bigint
-	Category: nvarchar(60)
