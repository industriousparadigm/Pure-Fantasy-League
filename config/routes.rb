Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
    get 'users/accept_invitation/:invitation_token', to: 'registrations#respond_invitation', as: :respond_invitation
    put 'users/accept_invitation', to: 'registrations#accept_invitation', as: :accept_invitation
  end

  resources :leagues do
    resources :managers do
      post :resend_invitation, to: 'managers#resend_invitation', on: :member
    end
  end

  root 'pages#index'

end
