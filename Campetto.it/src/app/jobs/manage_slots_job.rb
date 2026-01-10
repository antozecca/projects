class ManageSlotsJob < ApplicationJob
    queue_as :default
  
    def perform
      Slot.expired.destroy_all
    end
  end
  