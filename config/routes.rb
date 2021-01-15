Rails.application.routes.draw do
  resources :surgeries, only: [:index, :show, :update] do 
    resources :surgery_doctors, only: [:create]
  end
end
