Rails.application.routes.draw do
  get 'blands/index'
  get 'blands/show/:bland_cd' => "blands#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
