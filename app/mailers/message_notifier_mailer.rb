class MessageNotifierMailer < ApplicationMailer
  default :from => 'wichtelhuusboniswil@gmail.com'

  def send_new_message_email(message)
    @message = message
    mail( :to => 'tonja.haefeli@gmx.ch',
    :subject => 'Du hast eine neue Nachricht von WichtelHuus bekommen' )
  end
end
