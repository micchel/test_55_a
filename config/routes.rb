Rails.application.routes.draw do

  devise_for :users
  root to: "items#index"

  resources :u, only: :show
  
  get "mypage", to: "mypage#top"
  get "mypage/profile", to: "mypage#profile"
  get "mypage/card", to: "mypage#card"
  get "mypage/information", to: "mypage#information"
  get "logout", to: "mypage#logout"

  resources :items, only: [:show,:create]
  get "sell", to: "items#sell"
  get "sell/edit/:id", to: "items#edit_item"
  get "transaction/buy/:id", to: "items#buy_confirm"

  resources :signup do
    collection do
      get 'index'
      get 'new'
      get 'tel'
      get 'address' # ここで、入力の全てが終了する
      get 'done' # 登録完了後のページ
    end
  end
end
