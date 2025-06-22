-- Find police stations within or on the boundary of sub-metros
SELECT 
  s.name_2 AS sub_metro,
  p.name AS police_station
FROM 
  police_stations p
JOIN 
  submetros s
ON 
  ST_Intersects(s.geom, p.geom);