-- Find police stations within 100 meters of sub-metro boundaries
SELECT 
  s.name_2 AS sub_metro,
  p.name AS police_station,
  ST_Distance(s.geom::geography, p.geom::geography) AS distance_m
FROM 
  police_stations p
JOIN 
  submetros s
ON 
  ST_DWithin(s.geom::geography, p.geom::geography, 100)
ORDER BY distance_m;