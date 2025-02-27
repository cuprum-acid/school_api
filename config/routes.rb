Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  
  resources :students, only: [ :create, :destroy ]

  resources :schools, only: [] do
    resources :classes, only: [ :index ], controller: "school_classes" do
      resources :students, only: [ :index ]
    end
  end
end
