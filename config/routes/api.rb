namespace :api, :defaults => { :format => :json } do
  namespace :v1 do
    resources :documents, only: [:list, :create, :update] do
      collection do
        get 'list'
        match 'create', via: [:post, :put]
      end
    end
  end
end