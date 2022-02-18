Rails.application.routes.draw do
  get 'index/view'
  get 'index/input'
  root 'index#input'
end
