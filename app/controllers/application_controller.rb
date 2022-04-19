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

  get "/purchases" do 
    Purchase.all.to_json
  end  

  post "/purchases" do
    purchases = Purchase.create(
      pant_id: params[:pant_id],
      shirt_id: params[:shirt_id],
      shoe_id: params[:shoe_id],
    )
    a = Shoe.find_by(id: params[:shoe_id]).bought
    a = a + 1
    Shoe.find_by(id: params[:shoe_id]).update(bought: a)
    Purchase.all.to_json
  end

end