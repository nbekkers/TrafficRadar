TrafficRadar::Application.routes.draw do
  match 'locations' => 'locations#index'
end
