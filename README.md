# calculate-geodesic-distance
Octave/Matlab script to calculate the geodesic distance between two points on earth

Geodetic distance between two points using the Great circle formula
http://mathworld.wolfram.com/GreatCircle.html

Note: This formula can be applied only on a portion of the earth of < 100 km aprox.
A = [lon_a, lat_a], B = [lon_b, lat_b]
dist(A,B) = 6378 * acos( cos(lat_a)*cos(lat_b)*cos(lon_b-lon_a) + sin(lat_a)*sin(lat_b) )
