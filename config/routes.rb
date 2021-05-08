# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'questions#index', test_id: 1

  resources :tests do
    resources :questions
  end
end
