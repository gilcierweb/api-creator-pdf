namespace :api, :defaults => { :format => :json } do
  namespace :v1 do
    resources :documents, only: [:list, :create] do
      collection do
        get 'list'
      end
    end
  end
end