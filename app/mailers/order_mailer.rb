class OrderMailer < ApplicationMailer

  def mail_confirm order
    @order = order
    @user = User.find_by id: @order.user_id
    @order_details = OrderDetail.find_by order_id: @order.id
    mail to: @user.email, subject: "Order checkout details"
  end
end
