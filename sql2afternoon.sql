select * from invoice i 
join invoice_line il 
on il.invoice_id =
i.invoice_id where il.unit_price >0.99;


select i.invoice_date, c.first_name, c.last_name, i.total
from invoice i
join customer c on i.customer_id = c.customer_id;


select c.first_name, c.last_name, e.first_name, e.last_name
from customer customer
join employee e on c.support_rep_id = e.employee_id;

select al.title, ar.first_name
from album al 
join artist ar on al.artist_id = ar.artist_id;

select pt.track_id
from playlist_track pt
join playlist p on p.playlist_id = pt.playlist_id
where p.name = 'music';

select t.name
from track t
join playlist_track pt on pt.track_id = t.track_id
where pt.playlist_id = 5;

select t.name, p.name
from track t
join playlist_track pt on t.track_id = pt.track_id
join playlist p on pt.playlist_id = p.playlist_id;


select t.name, a.title
from track t
join album a on t.album_id = a.album_id
join genre g on g.genre_id = t.genre_id
where g.name = 'alternative rock';


select * from invoice
where invoice_id in (select invoice_id from invoice where unit_price > 0.99);
select * from playlist_track
where playlist_id in (select playlist_id from playlist where name = 'music');
select name from track
where track_id in (select track_id from playlist_track where playlist_id = 5);
select * from track
where genre_id in (select genre_id from genre where name = 'comedy');
select * from track
where album_id in (select album_id from album where title = 'Fireball');
select * from track
where album_id in (
    select album_id from album where album_id in (
        select artist_id from artist where name = 'queen'
    )
);


select * from invoice
where invoice_id in (select invoice_id from invoice_line where unit_price > 0.99);
select * from playlist_track
where playlist_id in (select playlist_id from playlist where name = 'music');
select name from track
where track_id in (select track_id from playlist_track where playlist_id =5);
select * from track
where genre_id in (select genre_id from genre where name = 'comedy');
select from track
where album_id in (select album_id from album where title = 'fireball')
select * from track
where album_id in (
    select album_id from album where artist_id in(
        select artist_id from artist where name = 'queen'
    )
);

update customer set fax = null where fax is not null;
update customer set company = 'self' where company is null;
update customer set last_name = 'thompson' where first_name = 'julia' and last_name = 'barnett';
update customer set support_rep_id=4 where email = 'luisrojas@yahoo.cl';
update track set composer = 'the darkness around us' where genre_id = (select genre_id
from genre where name = 'metal') and composer is null;

select COUNT(*), g.name from track t
join genre g ON t.genre_id = g.genre_id
group by g.name;
 
select COUNT(*), g.name from track t
join genre g ON g.genre_id = t.genre_id where g.name = 'Pop' or g.name = 'Rock'
group by g.name;
 
select ar.name, COUNT(*) from album al join artist ar on ar.artist_id = al.artist_id
group by ar.name;



select distinct composer from track;
select distinct billing_postal_code from invoice;
select distinct company from customer;


delete from practice_delete where type = 'bronze';
delete from practice_delete where type = 'silver'
delete from practice_delete where value = 150;