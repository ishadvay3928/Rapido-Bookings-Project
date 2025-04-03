create database rapido;
use rapido;

-- 1. Retrieve all successful bookings:
create view Successful_Bookings as
select * from bookings
where Booking_Status = 'Success';

-- 2. Find the average ride distance for each vehicle type:
create view Avg_Ride_Distance as 
select Vehicle_Type, avg(Ride_Distance) 
as Average_distance from bookings
group by Vehicle_Type;

-- 3. Get the total number of cancelled rides by customers:
create view cancelled_rides_count as
select count(*) from bookings 
where Booking_Status = 'Canceled by Customer';

-- 4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
select Customer_ID, count(Booking_ID) as Total_Rides 
from bookings 
group by Customer_ID
Order By Total_Rides Desc limit 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view RidesCancelledByDrivers_Due_To_PersonalAndCarRelatedIssues as
select count(*) from bookings where Reason_For_Cancelled_Rides_By_Driver = 'Personal & Car related issues';

-- 6. Find the maximum driver ratings for Cab Premium bookings:
create view Cab_Premium_maximum_driver_ratings as
select max(Driver_Ratings) as Maximum_rating
from bookings where Vehicle_Type = 'Cab Premium';

-- 7. Retrieve all rides where payment was made using UPI:
create view UPI_payment as
select * from bookings where Payment_Method = 'UPI';

-- 8. Find the average customer rating per vehicle type:
create view average_customer_rating as
select Vehicle_Type, avg(Customer_Ratings) as Average_customer_rating from bookings
group by Vehicle_Type;

-- 9. Calculate the total booking value of rides completed successfully:
create view total_booking_value as 
select sum(Booking_Value) as total_sucessful_value from bookings where Booking_Status = 'Success'; 

-- 10. List all incomplete rides along with the reason:
create view incomplete_rides_reason as
select Incomplete_Rides,Incomplete_Rides_Reason from bookings where Incomplete_Rides = 'Yes';