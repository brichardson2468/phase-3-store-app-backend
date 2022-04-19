class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/pants" do
    Pant.all.to_json
  end

  get "/shirts" do
    Shirt.all.to_json
  end

  get "/shoes" do 
    Shoe.all.to_json
  end



#   get "/pants/:id" do
#     pants.find(params[:id]).to_json(include: :purchases)
#   end
#   post  "/purchases" do
#     Purchases.create(params).to_json
#   end

end
