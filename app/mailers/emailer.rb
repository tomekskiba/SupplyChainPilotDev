class Emailer < ActionMailer::Base
  default :from => "US_Renal_MyDialysisSupply@baxter.com"

  def forgotten_psw_confirmation(user)
    @user = user
    mail(:to => user.email,
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
    sendto = "US_Renal_MyDialysisSupply@baxter.com"
    sendto =+ (";" + @user.clinic_email) unless (@user.clinic_email.nil? or @user.clinic_email.blank?)
    #mail(:to => "tomekskiba@yahoo.com",
    mail(#:to => "terry_morabito@baxter.com",
        :to => sendto,
        :subject => "New Order Notification")
  end
end