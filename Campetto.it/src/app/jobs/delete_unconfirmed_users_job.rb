class DeleteUnconfirmedUsersJob < ApplicationJob
  queue_as :default

  def perform
    # Seleziona tutti gli utenti non confermati che sono stati creati più di 1 ore fa
    User.where('confirmed_at IS NULL AND confirmation_sent_at < ?', 1.hours.ago).find_each do |user|
      user.destroy
    end
  end
end

