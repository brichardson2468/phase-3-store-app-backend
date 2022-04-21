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
    Purchase.all.to_json(include: [:shirt, :pant, :shoe ])
  end  

  get "/shoes-cart" do
    a = Purchase.where.not(shoe_id: nil).map { |t| t.shoe}
    a.to_json
  end

  get "/shirts-cart" do
    a = Purchase.where.not(shirt_id: nil).map { |t| t.shirt}
    a.to_json
  end

  get "/pants-cart" do
    a = Purchase.where.not(pant_id: nil).map { |t| t.pant}
    a.to_json
  end

  post "/shoe-purchases" do
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

  post "/pant-purchases" do
    purchases = Purchase.create(
      pant_id: params[:pant_id],
      shirt_id: params[:shirt_id],
      shoe_id: params[:shoe_id],
    )
    a = Pant.find_by(id: params[:pant_id]).bought
    a = a + 1
    Pant.find_by(id: params[:pant_id]).update(bought: a)
    Purchase.all.to_json
  end

  post "/shirt-purchases" do
    purchases = Purchase.create(
      pant_id: params[:pant_id],
      shirt_id: params[:shirt_id],
      shoe_id: params[:shoe_id],
    )
    a = Shirt.find_by(id: params[:shirt_id]).bought
    a = a + 1
    Shirt.find_by(id: params[:shirt_id]).update(bought: a)
    Purchase.all.to_json
  end

  delete '/delete-purchases/:id' do
    purchase = Purchase.find(params[:id])
    purchase.destroy
    purchase.to_json
  end 

  delete '/delete-all' do
    purchase = Purchase.deleteTable
    purchase.to_json
  end
end