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
