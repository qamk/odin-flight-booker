# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AIRPORTS = {
  'LHR' => %w[UK London],
  'SOF' => %w[Bulgaria Solfia],
  'PRG' => %w[Czechia Prague],
  'HEL' => %w[Finland Helsinki],
  'MRS' => %w[France Marseille],
  'FLR' => %w[Italy Florence],
  'KRK' => %w[Poland Krakow],
  'CLJ' => %w[Romania Cluj-Napoca]
}

FLIGHT_INFO = {
  'LHR' => {
    'SOF' => 180,
    'PRG' => 105,
    'HEL' => 165,
    'MRS' => 101,
    'FLR' => 118,
    'KRK' => 134,
    'CLJ' => 163,
  },
  'SOF' => {
    'PRG' => 108,
    'HEL' => 174,
    'MRS' => 138,
    'FLR' => 102,
    'KRK' => 92,
    'CLJ' => 61,
  },
  'PRG' => {
    'HEL' => 126,
    'MRS' => 103,
    'FLR' => 82,
    'KRK' => 57,
    'CLJ' => 86,
  },
  'HEL' => {
    'MRS' => 199,
    'FLR' => 181,
    'KRK' => 116,
    'CLJ' => 140,
  },
  'MRS' => {
    'FLR' => 64,
    'KRK' => 127,
    'CLJ' => 139,
  },
  'FLR' => {
    'KRK' => 99,
    'CLJ' => 104,
  },
  'KRK' => {
    'CLJ' => 62
  }
}
# Flight times are from https://www.flighttimecalculator.org/

START_TIMES = %w[14:00 14:30 15:00 15:30 16:00 16:30 17:00 17:30 18:00 18:30 19:00 19:30]
DATE_RANGE = (Date.today + 20)..(Date.today + 23)

def sample_time
  index = Random.rand(0..11)
  START_TIMES[index]
end

airports = AIRPORTS.map { |code, info| Airport.create(code: code, country: info[0], city: info[1]) }

def obtain_flight_info(from, to)
  FLIGHT_INFO[from][to] or FLIGHT_INFO[to][from]
end

def invalid_airport(from, to)
  from == to || FLIGHT_INFO[from].nil?
end

DATE_RANGE.each do |flight_date|
  airports.each do |from_airport|
    airports.each do |to_airport|
      next if invalid_airport(from_airport.code, to_airport.code)

      Flight.create(departing_airport: from_airport, arriving_airport: to_airport,
                    date: flight_date, time: sample_time,
                    duration: obtain_flight_info(from_airport.code, to_airport.code))
    end
  end
end