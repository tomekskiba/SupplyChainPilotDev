class Emailer < ActionMailer::Base
  default :from => "US_Renal_MyDialysisSupply@baxter.com"

  def forgotten_psw_confirmation(user)
    @user = user
    #@url  = "http://example.com/login"
    mail(#:to => "tomekskiba@yahoo.com",
         :to => user.email,
         :subject => "Password change confirmation")
  end

  def patient_order_confirmation(user)
    @user = user
    mail(:to => user.email,
         :subject => "Order Confirmation")
  end

  def representative_order_notification(user, order)
    @user = user
    @order = order
    mail(:to => "tomekskiba@yahoo.com",
         :subject => "New Order Notification")
  end
end