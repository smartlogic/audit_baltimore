AuditBaltimore::Application.routes.draw do
  resource :signer, :only => [:create, :update], :format => false do
    collection do
      get :verify
      get :verified
    end
  end

  root :to => "home#index"
end
