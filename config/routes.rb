Rails.application.routes.draw do
    resources :artists do
        resources :songs
    end

    resources :songs, only: [:show, :edit, :update, :destroy]
end
