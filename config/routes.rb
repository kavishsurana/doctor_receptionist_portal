# Rails.application.routes.draw do
#   # root 'sessions#new'

#   # resources :receptionists, except: [:show]
#   # resources :doctors, only: [:index, :new, :create]
#   # resources :patients, only: [:index, :new, :create, :show]
#   # get '/patients/graph', to: 'patients#graph', as: :patient_graph

#   get '/login', to: 'sessions#new'
#   post '/login', to: 'sessions#create'
#   delete '/logout', to: 'sessions#destroy'

#   # Receptionist routes
#   resources :receptionists, except: [:show]
#   resources :patients, only: [:new, :create, :edit, :update, :destroy]

#   # Doctor routes
#   resources :doctors, only: [:index, :new, :create]
#   resources :patients, only: [:index]
#   get '/patients/graph', to: 'patients#graph', as: :patient_graph

#   get '/receptionists', to: 'receptionists#index', as: :receptionists
#   get '/doctors', to: 'doctors#index', as: :doctors
#   get '/patients', to: 'patients#index', as: :patients_list

#   # Routes for specific doctor and receptionist actions
#   get '/receptionists/:id', to: 'receptionists#show', as: :receptionist
#   get '/doctors/:id', to: 'doctors#show', as: :doctor
#   get '/doctors/:id/patients', to: 'doctors#patients', as: :doctor_patients

#   # ...
# end



Rails.application.routes.draw do
  root 'sessions#new'

  # Authentication routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Receptionist routes
  resources :receptionists, except: [:show]
  resources :patients

  # Doctor routes
  resources :doctors, only: [:index, :new, :create]
  resources :patients, only: [:index]
  get '/patients/graph', to: 'patients#graph', as: :patient_graph

  # Additional routes for Receptionists and Doctors
  get '/receptionist', to: 'receptionists#index', as: :receptionist_dashboard
  get '/doctor', to: 'doctors#index', as: :doctor_index
  get '/patient', to: 'patients#index', as: :patients_list

  # Routes for specific doctor and receptionist actions
  get '/receptionist/:id', to: 'receptionist#show', as: :rec
  get '/doctor/:id', to: 'doctor#show', as: :doctor_show
  get '/doctor/:id/patient', to: 'doctor#patient', as: :doctor_patient

  # ...
end
