get '/' do
  redirect '/contacts'
end

# index
get '/contacts' do
  @contacts = Contact.all
  erb :'contacts/index'
end


# new
get '/contacts/new' do
  erb :'contacts/new'
end

# create
post '/contacts' do
  puts params
  @contact = Contact.create(params[:contact])
  redirect '/contacts'
end

# show
get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :'contacts/show'
end

# edit
get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
  erb :'edit'
end

# update
patch '/contacts/:id' do

end

put '/contacts/:id' do

end
