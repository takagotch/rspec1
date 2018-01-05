class User < ActiveRecord::Base
	has_many :received_msg, :class_name => Msg.name, foreign_key => "recipient_id"
	has_many :sent_msgs, :class_name => Msg.name, :foreign_key => "sender_id"
belogs_to :subscription

  def send_msg(msg_attrs)
#  Msg.create! msg_attrs
	  if subscription.can_send_msg?
	  sent_msgs.create! msg_attrs
	  end
  end
end

