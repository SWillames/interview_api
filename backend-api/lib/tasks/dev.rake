require 'faker'
namespace :dev do
  DEFAULT_PASSWORD = 123456

  desc "Set up the development environment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Deleting BD...") {%x(rails db:drop)}
      show_spinner("Creating BD...") {%x(rails db:create)}
      show_spinner("Migrating the BD...") {%x(rails db:migrate)}
      show_spinner("Registering the customer default...") {%x(rails dev:add_default_user)}
    else
      puts "You are not in the development environment."
    end
  end

  desc "Add the default user"
  task add_default_user: :environment do
    email = "user.default@example.com"
    user = User.new(uid: Faker::Lorem.word, email: email, name: Faker::Name.name, 
                    nickname: Faker::Internet.user_name, provider: "email", 
                    password: DEFAULT_PASSWORD, password_confirmation: DEFAULT_PASSWORD
    )
    user.save!
  end


  private
  def show_spinner(msg_start, msg_end = "Concluido")
    spinner = TTY::Spinner.new("[:spinner) #{msg_start}", format: :dots_9)
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")
  end
end
