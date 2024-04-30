Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :companies, only: [], param: :company_id do
    member do
      put 'import_departments', to: 'companies/import_departments#update'
    end
  end
end
