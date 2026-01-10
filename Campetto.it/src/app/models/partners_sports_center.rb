class PartnersSportsCenter < ApplicationRecord
    belongs_to :partner
    belongs_to :sports_center
end
