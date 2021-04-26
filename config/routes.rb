Rails.application.routes.draw do
  get  '/',         to:'prime#index'
  post '/file',     to:'prime#file_upload'
  post '/file/csv', to:'prime#file_download'
end
