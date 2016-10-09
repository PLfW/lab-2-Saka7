SELECT 
  u.first_name, u.email,
  df.country || ' ' || df.city as "From" ,
  dt.country || ' ' || dt.city as "To" ,
  f.name, f.price, f.departure,
  o.paying_time
FROM orders o
JOIN users u on o.user_id = u.id
JOIN flights f on o.flight_id = f.id
JOIN destinations df on df.id = f.from_point
JOIN destinations dt on dt.id = f.to_point
WHERE o.is_paid = true
ORDER BY o.paying_time DESC;
