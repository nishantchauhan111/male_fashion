class UserMailer < ApplicationMailer
    default from: "chauhannishant7070@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "logged in as #{user.email}")
  end

  def logout_email(user)
    @user = user
    mail(to: @user.email, subject: "logged out as #{@user.email}")
  end
end
