Rails.application.routes.draw do
  get 'welcome/index'
 
  root 'welcome#index'
  
  post '/scrape', to: 'welcome#scrape', as: 'scrape'
  
end