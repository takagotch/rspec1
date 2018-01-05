def create
 #Msg.new(params[:msg])
 #redirect_to :action => "index"
  message = Message.new(params[:message])
  message.save
  redirect_to :action => "index"
end

