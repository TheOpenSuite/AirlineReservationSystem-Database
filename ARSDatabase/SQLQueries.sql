USE AirportReservationSystem;

GO

CREATE TRIGGER update_Available_Seats
ON Reservation
AFTER INSERT, DELETE
AS
BEGIN
  UPDATE Flight
  SET Available_Seats = Num_Seats - (SELECT COUNT(*) FROM Reservation WHERE flight_id = inserted.flight_id AND status = 'completed')
  FROM inserted
  WHERE Flight.flight_id = inserted.flight_id;
END;

GO

SELECT * FROM Reservation
WHERE Pass_ID = 207474;

SELECT * FROM Flight
WHERE Dep_Air = [Dep_Air] AND Arrival_Air = [Arrival_Air];

SELECT Passengers.Name, Ticket.Ticket_Num, Flight.Arrival_Date_Time FROM Passengers 
INNER JOIN Reservation ON Passengers.Pass_ID = Reservation.Pass_ID 
INNER JOIN Ticket ON Reservation.Res_ID = Ticket.Res_ID 
INNER JOIN Flight ON Ticket.Flight_ID = Flight.Flight_ID 
WHERE Passengers.Pass_ID = 211659; 

SELECT f.Duration AS Flight_Duration, r.Status AS Flight_Status, f.Arrival_Air AS Arrival_Airport FROM Flight f 
JOIN Reservation r ON f.Flight_ID = r.Flight_ID WHERE f.Flight_ID = 'AA101'; 

SELECT DATEDIFF(hour, Arrival_Date_Time, Dep_Date_Time) AS Duration FROM Flight 
WHERE Flight_ID = 'AA101'

SELECT SUM(Price) FROM Flight f JOIN Reservation r ON f.Flight_ID = r.Flight_ID 
WHERE f.Flight_ID = 'AA101' AND r.Status = 'confirmed';

SELECT* FROM Passengers 
WHERE Phone LIKE '011%';

SELECT f.Arrival_date_time, f.Price, f.Arrival_Air, COUNT(r.Pass_ID) AS num_passengers FROM Flight f 
JOIN Reservation r ON f.Flight_ID = r.Flight_ID 
WHERE f.Flight_ID = 'AA101' 
GROUP BY f.Arrival_date_time, f.Price, f.Arrival_Air;

SELECT Flight.Flight_ID, COUNT(Reservation.Res_ID) AS Total_Reservations FROM Flight 
INNER JOIN Reservation ON Flight.Flight_ID = Reservation.Flight_ID 
GROUP BY Flight.Flight_ID; 

SELECT * FROM Flight 
WHERE Flight_ID 
IN(SELECT Flight_ID FROM Reservation WHERE Status = 'confirmed') AND Arrival_Air<> 'RUH'; 

SELECT * FROM passengers 
WHERE Pass_ID NOT IN(SELECT Pass_ID FROM Reservation); 



-------------------------- Nested
SELECT * FROM passengers
WHERE Pass_ID IN (SELECT Pass_ID FROM Reservation WHERE flight_id IN (SELECT flight_id FROM Flight WHERE Dep_Air = 'CAI'));

--------------------------Main operations of the system:
SELECT * FROM Flight
WHERE Dep_Air = [Dep_Air] AND Arrival_Air = [Arrival_Air];

SELECT passengers.Pass_ID, passengers.name, passengers.email, passengers.phone,
passengers.address FROM passengers
INNER JOIN Reservation ON passengers.Pass_ID = Reservation.Pass_ID
WHERE Reservation.status = 'pending';

SELECT * FROM passengers
WHERE Pass_ID NOT IN (SELECT Pass_ID FROM Reservation);

