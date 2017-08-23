get '/' do
  @contacts = Contact.all
  erb :index
end
