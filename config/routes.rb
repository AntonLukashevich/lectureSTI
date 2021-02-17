Rails.application.routes.draw do
  get 'lectures/index'

  resources :lectures do
    #resources :lecture_blocks
    resources :text_contents, controller: :text_contents, type: 'TextContent'
    resources :images, controller: :video_contents, type: 'ImageContent'
    resources :videos, controller: :lecture_blocks, type: 'VideoContent'
  end
  resources :pictures, only: [:create, :destroy]
  root 'lectures#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
