class MessageNotifierMailer < ApplicationMailer
  default :from => 'tonja.haefeli@gmx.ch'

  def send_new_message_email(message)
    @message = message
    mail( :to => 'mat@matyou.net',
    :subject => 'Du hast eine neue Nachricht von WichtelHuus bekommen' )
  end
end
