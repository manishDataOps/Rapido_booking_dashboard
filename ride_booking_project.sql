
select 
city, count(booking_id) as total_booking
from booking_rawdata
group by city;



