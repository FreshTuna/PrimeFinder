Rails.application.routes.draw do
  get '/', to:'prime#index'
  post '/', to:'prime#file'
end
