AmandaCms::Engine.routes.draw do
  scope "/:entry_type" do
    resources :entries
  end

  resources :entry_groups

  root 'dashboard#index'
end
