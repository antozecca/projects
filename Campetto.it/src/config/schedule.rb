# config/schedule.rb

every 1.hour do
    runner "DeleteUnconfirmedUsersJob.perform_later"
end

every 1.day, at: '00:01 am' do
    runner "ManageSlotsJob.perform_now"
end
  
every 1.day, at: '12:00 am' do
    runner "Slot.generate_daily_slots"
end
  