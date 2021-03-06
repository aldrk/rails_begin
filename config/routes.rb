# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
             controllers: { registrations: :register, sessions: :sessions }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :results, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  resources :badges, only: :index
  resources :own_badges, only: :index

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member # member - get test id to patch

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: :index
    resources :badges
  end

end
