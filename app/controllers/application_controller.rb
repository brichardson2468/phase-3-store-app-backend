class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/pants" do
    pants.all.to_json
  end
  get "/pants/:id" do
    pants.find(params[:id]).to_json(include: :purchases)
  end
  post  "/purchases" do
    Purchases.create(params).to_json
  end

end
