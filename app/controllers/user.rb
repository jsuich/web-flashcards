enable :sessions
# GET #############################

get '/user_home/:id' do

  erb :user_home
end

get '/round' do
  erb :round
end


# POST #############################

post '/user_home' do
  # @user = User.find_by_email(params[:email])  
    # => This route /user>home has MAJOR Bug

  # => Error raised when attempting to log a user into the home page:
  # => ActiveRecord::StatementInvalid at /user_home
  # PG::UndefinedTable: ERROR: relation "users" does not exist LINE 5: WHERE a.attrelid = '"users"'::regclass ^ : SELECT a.attname, format_type(a.atttypid, a.atttypmod), pg_get_expr(d.adbin, d.adrelid), a.attnotnull, a.atttypid, a.atttypmod FROM pg_attribute a LEFT JOIN pg_attrdef d ON a.attrelid = d.adrelid AND a.attnum = d.adnum WHERE a.attrelid = '"users"'::regclass AND a.attnum > 0 AND NOT a.attisdropped ORDER BY a.attnum

  # => Alternate attempted code...
  @user = User.where(email: params[:email]) # => Got new error:NoMethodError at /user_home
    # undefined method `authenticate' for #<ActiveRecord::Relation::ActiveRecord_Relation_User:0x007fa22cb132f0>

  if @user.authenticate(params[:password])
    session[:user_id] = @user.id
    puts
    puts " The current user is #{current_user.email}" 
    puts
    erb :user_home
  else
    redirect ("/") # mustdisplay not valid login msg.
  end

end


post '/new_user' do 
  if @user = User.create(params[:user])
    redirect ("/user_home/#{@user.id}")
  else
    redirect ("/") # must display not valid registrtation msg.
  end

end

post '/logout' do
  session.clear
  redirect ("/")
end
