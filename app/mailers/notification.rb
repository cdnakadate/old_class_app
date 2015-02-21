class Notification < ActionMailer::Base
  default from: 'notifications@example.com'
 mail = @mail
  def send_email(mail)
    
    @url  = 'http://teacher_evaluations.com'
    mail(to: mail, subject: 'Welcome to My Awesome Site')
  end
end
