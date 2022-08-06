class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    Message.all.to_json
  end

  post '/messages' do
    msg = Message.create body: params[:body], username: params[:username]
    msg.to_json
  end

  patch '/messages/:id' do
    msg = Message.find params[:id]
    msg.body = params[:body]
    msg.save
    msg.to_json
  end

  delete '/messages/:id' do
    Message.destroy params[:id]
  end
  
end
