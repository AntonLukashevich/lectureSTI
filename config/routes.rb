Rails.application.routes.draw do
  get 'lectures/index'

  resources :lectures do
    resources :texts, controller: :lecture_blocks, type: 'TextContent'
    resources :images, controller: :lecture_blocks, type: 'ImageContent'
    resources :videos, controller: :lecture_blocks, type: 'VideoContent'
    resources :lecture_blocks


  end
  root 'lectures#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
