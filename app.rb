require("bundler/setup")
Bundler.require(:default)
require("pry")

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @stores = Store.all()
  @brands = Brand.all()
  erb(:index)
end

post('/stores') do
  name = params.fetch('store-name')
  @store = Store.new({:name => name})
  if @store.save()
    redirect '/'
  else
    erb(:errors)
  end
end

post('/brands') do
  name = params.fetch('brand-name')
  @brand = Brand.new({:name => name})
  if @brand.save()
    redirect '/'
  else
    erb(:errors_brand)
  end
end

get('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i)
  @brands = Brand.all()
  erb(:store_detail)
end

get('/brands/:id') do
  @brand = Brand.find(params.fetch('id').to_i)
  @stores = Store.all()
  erb(:brand_detail)
end

patch('/stores/:id/edit') do
  @store = Store.find(params.fetch('id').to_i)
  name = params.fetch('new-store-name')
  @store.update({:name => name})
  redirect "/stores/#{params.fetch('id').to_i}"
end

delete('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i)
  @store.destroy()
  redirect "/"
end

patch('/brands/:id/edit') do
  @brand = Brand.find(params.fetch('id').to_i)
  name = params.fetch('new-brand-name')
  @brand.update({:name => name})
  redirect "/brands/#{params.fetch('id').to_i}"
end

delete('/brands/:id') do
  @brand = Brand.find(params.fetch('id').to_i)
  @brand.destroy()
  redirect "/"
end

patch('/stores/:id') do
  brand = Brand.find(params.fetch("brand_id").to_i)
  @store = Store.find(params.fetch('id').to_i)
  @store.brands.push(brand)
  redirect back
end

patch('/brands/:id') do
  store = Store.find(params.fetch("store_id").to_i)
  @brand = Brand.find(params.fetch('id').to_i)
  @brand.stores.push(store)
  redirect back
end
