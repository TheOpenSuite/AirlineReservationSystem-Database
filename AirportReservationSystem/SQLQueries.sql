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

SELECT * FROM Reservation
INNER JOIN passengers ON Reservation.Pass_ID = passengers.Pass_ID;

SELECT SUM(Available_Seats)
FROM Flight;

SELECT Num_Seats - Available_Seats AS Seats_Taken
FROM Flight;

SELECT SUM(Price) FROM Flight
WHERE flight_id = [flight_id];

SELECT * FROM Flight
WHERE Dep_Air = 'Cairo';

SELECT Reservation.Pass_ID, Reservation.flight_id, Reservation.Seat_Num, Flight.Arrival_Date_Time
FROM Reservation
INNER JOIN Flight ON Reservation.flight_id = Flight.flight_id
INNER JOIN passengers ON Reservation.Pass_ID = passengers.Pass_ID
INNER JOIN AIRPORT ON Flight.Arrival_Air = AIRPORT.Airport_Code
WHERE AIRPORT.country = 'USA';

SELECT passengers.Pass_ID, passengers.name, passengers.email, passengers.phone, passengers.address FROM passengers
INNER JOIN Reservation ON passengers.Pass_ID = Reservation.Pass_ID
WHERE Reservation.status = 'pending';

SELECT passengers.Pass_ID FROM passengers
INNER JOIN Reservation ON passengers.Pass_ID = Reservation.Pass_ID
INNER JOIN Flight ON Reservation.flight_id = Flight.flight_id
WHERE Reservation.status = 'completed' AND Flight.Arrival_Air = 'Riyadh';

SELECT * FROM passengers
WHERE Pass_ID NOT IN (SELECT Pass_ID FROM Reservation);



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

