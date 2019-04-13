-- 1
select avg(price) from Is_Available_Calendar C
join Is_Accomodation A on A.listing_Id = C.listing_Id
where A.bedrooms = 8

-- 2
select avg(cleanliness) from Rates_Score R
join Has H on H.listing_Id = R.listing_Id
join Amenities A on A.amenities_ID = H.amenities_ID
where A.amenity = TV

-- 3
select H.host_ID, H.host_name from host H
join Listing_Owns L on L.Host_Id = H.host_ID
join Is_Available_Calendar C  on L.listing_Id = C.listing_Id
where C.daate between ’01-MAR-2019’ and ’31-SEP-2019’

-- 4
select count(L1. listing_Id) from Listing_Owns L1, Listing_Owns L2
join host H1 on L1.Host_Id = H1.host_ID
join host H2 on L2.Host_Id = H2.host_ID
where L1. listing_Id = L2. listing_Id and H1.host_ID != H2.host_ID

-- 5
select C.daate from Is_Available_Calendar C
join Listing_Owns L on C.listing_Id = L.listing_Id
where L.name = ‘Viajes Eco’

-- 6
select R.Host_id, R.Host_name from
( select H.Host_Id, H.Host_name, count(L.listing_id) as counter from Host H join Listing_Owns L on L.Host_Id = H.host_ID ) R
where R.counter = 1

--7
-- it is much more easier to compute the average of price with Wifi. For listings without wifi, we compute : the total number of listing, the sum of
-- their prices, the total number of listings with wifi and the sum of their prices. Now we can compute the difference in the average price of listings
-- with and without wifi.
select (T.SumTotal-W.SumWifi)/(T.n-W.m) - W.SumWifi/W.m as noWifi-Wifi from (select count(*) as n, sum(L1.price) as SumTotal from Listing_Owns L1) T,
(select count(*) as m, sum(L2.price) as SumWifi from Listing_Owns L2 join Amenities A2 on A2.listing_Id = L2.listing_Id where A2.amenity = Wifi) W

-- 8
select Ber.avgB - Mad.avgM as average : Berlin - Madrid
from (select avg(price) as avgB from Is_Available_Calendar C1 Join Listing_Owns L1 on C1.listing_Id = L1.listing_Id
Join Is_Accomodation A1 on A1.listing_Id = L1.listing_Id where A1.beds = 8 and L1.city = Berlin ) Ber,
(select avg(price) as avgB from Is_Available_Calendar C1 Join Listing_Owns L1 on C1.listing_Id = L1.listing_Id
Join Is_Accomodation A1 on A1.listing_Id = L1.listing_Id where A1.beds = 8 and L1.city = Madrid) Mad

-- 9
select R.host_ID, R.host_name from (select host_ID, host_name, count(listing_Id) as counter from Host H join Listing_Owns L
on L.host_ID = H.host_ID where L.country = Spain order by counter ASC) R where ROWNUM <= 10

-- 10
select R.listing_Id, R.name from
(select L.listing_Id, L.name, S.rate from Listing_Owns L join Score S on S.listing_Id = L.listing_id
where L.city = Barcelona order by S.rate DESC) R
where ROWNUM <= 10
