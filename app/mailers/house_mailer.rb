class HouseMailer < ApplicationMailer
  def new_house_email
    @house = params[:house]

    mail(to: 'rasholuoch@gmail.com', subject: 'You got a new house creation!')
    mail(to: 'demo.oluoch@gmail.com', subject: 'You have created a new house!')
  end
end
