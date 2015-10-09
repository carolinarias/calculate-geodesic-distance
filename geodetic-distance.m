%% Geodetic distance between two points using the Great circle formula
%% http://mathworld.wolfram.com/GreatCircle.html
%% Note: This formula can be applied only on a portion of the earth of < 100 km aprox.
%% A = [lon_a, lat_a], B = [lon_b, lat_b]
%% dist(A,B) = 6378 * acos( cos(lat_a)*cos(lat_b)*cos(lon_b-lon_a) + sin(lat_a)*sin(lat_b) )

format long
% Coordinates of the grid points [ longitude, latitude ] (values are in degrees)
p1 = [ 9.011533669936474, 45.56821407553667 ]
p2 = [ 9.312688264185276, 45.56778671132765 ]
p3 = [ 9.311521155996243, 45.356261753717845 ]
p4 = [ 9.011490619692509, 45.356685994655464 ]

% Convert longitude and latitude coordinates in radians
p1_rad = p1 * pi / 180
p2_rad = p2 * pi / 180
p3_rad = p3 * pi / 180
p4_rad = p4 * pi / 180

% Calculate geodesic distances between points
d12 = 6378 * acos(cos(p1_rad(2)) * cos(p2_rad(2)) * cos(p2_rad(1) - p1_rad(1)) + sin(p1_rad(2)) * sin(p2_rad(2)))
d34 = 6378 * acos(cos(p3_rad(2)) * cos(p4_rad(2)) * cos(p4_rad(1) - p3_rad(1)) + sin(p3_rad(2)) * sin(p4_rad(2)))
d14 = 6378 * acos(cos(p1_rad(2)) * cos(p4_rad(2)) * cos(p4_rad(1) - p1_rad(1)) + sin(p1_rad(2)) * sin(p4_rad(2)))
d23 = 6378 * acos(cos(p2_rad(2)) * cos(p3_rad(2)) * cos(p3_rad(1) - p2_rad(1)) + sin(p2_rad(2)) * sin(p3_rad(2)))

% Calculate errors
longitude_error = d12 - d34
latitude_error = d14 - d23

%%

% Coordinates of the new grid points [ longitude, latitude ] (values are in degrees)
p5 = [ p1(1), p4(2) ]
p6 = [ p2(1), p3(2) ]
p7 = [ p1(1), p2(2) ]
p8 = [ p4(1), p3(2) ]

% Convert longitude and latitude coordinates in radians
p5_rad = p5 * pi / 180
p6_rad = p6 * pi / 180
p7_rad = p7 * pi / 180
p8_rad = p8 * pi / 180

% Calculate geodesic distances between points
d56 = 6378 * acos(cos(p5_rad(2)) * cos(p6_rad(2)) * cos(p6_rad(1) - p5_rad(1)) + sin(p5_rad(2)) * sin(p6_rad(2)))
d78 = 6378 * acos(cos(p7_rad(2)) * cos(p8_rad(2)) * cos(p8_rad(1) - p7_rad(1)) + sin(p7_rad(2)) * sin(p8_rad(2)))
d58 = 6378 * acos(cos(p5_rad(2)) * cos(p8_rad(2)) * cos(p8_rad(1) - p5_rad(1)) + sin(p5_rad(2)) * sin(p8_rad(2)))
d67 = 6378 * acos(cos(p6_rad(2)) * cos(p7_rad(2)) * cos(p7_rad(1) - p6_rad(1)) + sin(p6_rad(2)) * sin(p7_rad(2)))

%%

% Coordinates of the mean points [ longitude, latitude ] (values are in degrees)
p1m = [ (p1(1) + p4(1)) / 2, (p1(2) + p2(2)) / 2 ]
p2m = [ (p2(1) + p3(1)) / 2, (p1(2) + p2(2)) / 2 ]
p3m = [ (p2(1) + p3(1)) / 2, (p3(2) + p4(2)) / 2 ]
p4m = [ (p4(1) + p1(1)) / 2, (p3(2) + p4(2)) / 2 ]

% Convert longitude and latitude coordinates in radians
p1m_rad = p1m * pi / 180
p2m_rad = p2m * pi / 180
p3m_rad = p3m * pi / 180
p4m_rad = p4m * pi / 180

% Calculate geodesic distances between mean points
d12m = 6378 * acos(cos(p1m_rad(2)) * cos(p2m_rad(2)) * cos(p2m_rad(1) - p1m_rad(1)) + sin(p1m_rad(2)) * sin(p2m_rad(2)))
d34m = 6378 * acos(cos(p3m_rad(2)) * cos(p4m_rad(2)) * cos(p4m_rad(1) - p3m_rad(1)) + sin(p3m_rad(2)) * sin(p4m_rad(2)))
d14m = 6378 * acos(cos(p1m_rad(2)) * cos(p4m_rad(2)) * cos(p4m_rad(1) - p1m_rad(1)) + sin(p1m_rad(2)) * sin(p4m_rad(2)))
d23m = 6378 * acos(cos(p2m_rad(2)) * cos(p3m_rad(2)) * cos(p3m_rad(1) - p2m_rad(1)) + sin(p2m_rad(2)) * sin(p3m_rad(2)))

%%

% Calculate steps for longitude and latitude
step_longitude = abs(p4m(1) - p3m(1)) / 100
step_latitude = abs(p4m(2) - p1m(2)) / 100


>> p1m(1),p4(2)
ans =  9.01151214481449
ans =  45.3566859946555

