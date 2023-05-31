% Define flights
flight(flight1, 'CityA', 'CityB', 8:00, 10:00).
flight(flight2, 'CityB', 'CityC', 10:30, 12:30).
flight(flight3, 'CityC', 'CityA', 14:00, 16:00).

% Define cargos
cargo(cargo1, 'CityA', 'CityC', 8:30).
cargo(cargo2, 'CityB', 'CityA', 9:30).
cargo(cargo3, 'CityC', 'CityB', 11:00).
cargo(cargo4, 'CityA', 'CityB', 15:00).
cargo(cargo5, 'CityA', 'CityC', 20:00).

% Number of flights
num_flights(3).

% Number of cargos
num_cargos(4).

% Define rules
flight_schedule(Source, Destination, StartTime, EndTime, Flight) :-
  flight(Flight, Source, Destination, StartTime, EndTime).

cargo_schedule(Source, Destination, StartTime, Cargo) :-
  cargo(Cargo, Source, Destination, StartTime).

num_cargos_between(Source, Destination, Count) :-
  findall(_, cargo_schedule(Source, Destination, _, _), Cargos),
  length(Cargos, Count).

% Example queries
?- num_cargos_between('CityA', 'CityB', Count).
?- num_cargos_between('CityB', 'CityC', Count).
