TrafficRadar::Application.routes.draw do
  match 'locations' => 'locations#index'
  match 'traffic/(:ids)' => "traffic#index"
end
