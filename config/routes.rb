Rails.application.routes.draw do

  devise_for :users, ActiveAdmin::Devise.config.merge(controllers: { registrations: 'registrations' })
  ActiveAdmin.routes(self)
  devise_scope :user do
    get 'users/accept_invitation/:invitation_token', to: 'registrations#respond_invitation', as: :respond_invitation
    put 'users/accept_invitation', to: 'registrations#accept_invitation', as: :accept_invitation
  end

  post 'set_league/:id', to: 'league#set', as: :set_league

  resources :teams
  resources :players

  # get :admin, to: 'admin#index'
  # scope :admin, module: :admin, as: :admin do
  #   resources :leagues do
  #     resources :teams
  #     post 'managers/add_myself', to: 'managers#add_myself'
  #     resources :managers do
  #       post :resend_invitation, to: 'managers#resend_invitation', on: :member
  #       delete :delete_invitation, to: 'managers#delete_invitation', on: :member
  #     end
  #   end
  # end

  root 'dashboard#index'

end
