# frozen_string_literal: true

# LocomotiveEngineer is a class that is responsible for generating and fixing
# lists of wagons, adding missing stops, and extending route information.
class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagon_id)
    wagon_id
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    ordered_wagons = each_wagons_id.rotate(2)
    ordered_wagons.insert(1, *missing_wagons) if ordered_wagons[0] == 1
  end

  def self.add_missing_stops(route, **missing_stops)
    route = route.merge(stops: [])
    missing_stops.each_value { |stop| route[:stops] << stop }

    route
  end

  def self.extend_route_information(route, more_route_information)
    route.merge!(more_route_information)
  end
end

# p LocomotiveEngineer.generate_list_of_wagons(1, 2, 3)
# p LocomotiveEngineer.fix_list_of_wagons([2, 5, 1, 7, 4, 12, 6, 3, 13], [3, 17, 6, 15])
# p LocomotiveEngineer.add_missing_stops({ from: 'Moscow', to: 'Vladivostok' }, stop_1: 'Kazan', stop_2: 'Chelyabinsk')
# p LocomotiveEngineer.extend_route_information({ from: 'Moscow', to: 'Vladivostok' }, { length: '9288', speed: '60' })
