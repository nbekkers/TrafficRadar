TrafficRadar::Application.routes.draw do
  match 'locations' => 'locations#index'
  match 'traffic/(:location_ids)' => "traffic#index"
end
