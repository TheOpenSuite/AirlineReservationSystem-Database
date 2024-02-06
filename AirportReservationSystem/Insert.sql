USE AirportReservationSystem;

INSERT INTO Passengers
VALUES 
(211659, 'Peter Griffin Damascus', 'Hasteplzwork@gmail.com', '01025257878', '123 main St, anytown'),
(207474, 'Gordan Jolie Marxus', 'GordonRamsy@gmail.com', '01144167433', '456 side St, everytown'),
(188683, 'Luke Emia Salah', 'DemitrusDemarcus@gmail.com', '01276548345', '789 Front St, town'),
(210321, 'Michael Trevor Franklin', 'BigSmoke@yahoo.com', '01235478653', '135 Back St, woptytown'),
(213829, 'Trevor Dsanta Ron', 'Port420@gmail.com', '0105382468', '573 left St, notown'),
(192546, 'Alphonse Gabriel Capone', 'TonyMontana@gmail.com', '0153572466', '332 right St, eachtown');

INSERT INTO Flight
VALUES
('AA101', CONVERT(DATETIME, '02-03-2023 07:45:00', 105), CONVERT(DATETIME, '01-03-2023 23:30:00', 105), 130, 700, 300, '8 Hrs', 'CAI', 'LAX'),
('AC204', CONVERT(DATETIME, '04-03-2023 06:00:00', 105), CONVERT(DATETIME, '04-03-2023 03:00:00', 105), 30, 300, 240, '3 Hrs', 'CAI', 'RUH'),
('ZE53', CONVERT(DATETIME, '02-03-2023 10:35:00', 105), CONVERT(DATETIME, '02-03-2023 09:55:00', 105), 85, 75, 100, '0.6 Hrs', 'CAI', 'SSH'),
('BA142', CONVERT(DATETIME, '04-03-2023 05:35:00', 105), CONVERT(DATETIME, '03-03-2023 17:05:00', 105), 50, 500, 350, '12.6 Hrs', 'CAI', 'NRT'),
('AB321', CONVERT(DATETIME, '05-03-2023 07:45:00', 105), CONVERT(DATETIME, '04-03-2023 07:45:00', 105), 100, 1000, 150, '24 Hrs', 'LAX', 'CAL'),
('GC213', CONVERT(DATETIME, '05-03-2023 08:45:00', 105), CONVERT(DATETIME, '04-03-2023 1:45:00', 105), 20, 400, 200, '7 Hrs', 'CAI', 'MUC');



INSERT INTO Reservation (Res_ID, Pass_ID, Flight_ID, Seat_Num, Status, Res_Date_Time) 
VALUES 
('12E5', 207474, 'AA101', 'A35', 'Confirmed', CONVERT(DATETIME, '28-02-2023 10:03:03', 105)),
('469A', 188683, 'AC204', 'C54', 'Confirmed', CONVERT(DATETIME, '25-02-2023 01:07:13', 105)),
('420E', 211659, 'BA142', 'D03', 'Confirmed', CONVERT(DATETIME, '01-02-2023 15:40:42', 105)),
('Q666', 210321, 'AA101', 'A16', 'Pending', CONVERT(DATETIME, '03-03-2023 21:34:57', 105)),
('GE51', 192546, 'GC213', 'B15', 'Confirmed', CONVERT(DATETIME, '28-02-2023 10:03:03', 105)),
('14R3', 213829, 'AB321', 'C05', 'Pending', CONVERT(DATETIME, '07-03-2023 11:00:18', 105));

Insert into Ticket (Ticket_Num, Res_ID, Pass_ID, Seat_Num, Issued_Date_Time, Flight_ID)
VALUES
('G03', '12E5', 207474, 'A35', CONVERT(DATETIME, '01-03-2023 10:03:03', 105), 'AA101'),
('F17', '420E', 211659, 'D03', CONVERT(DATETIME, '26-02-2023 01:07:13', 105), 'BA142'),
('T07', 'Q666', 210321, 'A16', CONVERT(DATETIME, '02-02-2023 15:40:42', 105), 'AA101'),
('P39', '469A', 188683, 'C54', CONVERT(DATETIME, '04-03-2023 21:34:57', 105), 'AC204'),
('Z08' ,'Q666', 211659, 'A16', CONVERT(DATETIME, '29-12-2023 23:00:00', 105), 'BA142'),
('O40' ,'420E', 207474, 'A35', CONVERT(DATETIME, '15-09-2023 04:45:00', 105), 'AC204');

Insert into Airport
VALUES
('CAI', 'Cairo', 'Cairo International Airport', 'Cairo Governorate', 'Egypt'),
('LAX', 'Los Angeles', 'Los Angeles International Airport', 'CA', 'USA'),
('SSH', 'Sharm El Sheikh', 'Sharm El Sheikh International Airport', 'Null', 'Egypt'),
('RUH', 'Riyadh', 'King Khalid International Airport', 'El-Najd', 'KSA'),
('MUC', 'Munich', 'Munich International Airport', 'Bavaria', 'Germany'),
('CDG', 'Paris', 'Paris Charles de Gaulle Airport', 'Europe', 'France');


