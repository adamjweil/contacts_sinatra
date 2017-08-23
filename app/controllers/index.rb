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
  if request.xhr?
    if request.accept? 'application/json'
      @contact.to_json
    else
      erb :'contacts/_contact', layout: false
    end
    else
    erb :'contacts/show'
  end
end

# edit
get '/contacts/edit/:id' do
  @contact = Contact.find(params[:id])
  erb :'contacts/edit'
end

# update method
def update_contact
  @contact = Contact.find(params[:id])
  @contact.update(params[:contact])
  puts params
  redirect "/contacts/show/#{@contact.id}"
end
# update
patch '/contacts/:id' do
  update_contact
end
put '/contacts/:id' do
  update_contact
end

# delete
delete '/contacts/:id' do
  Contact.find(params[:id]).destroy!
  redirect '/contacts'
end
