class Read < ApplicationRecord
  scope :hot, -> {
      where('reads.created_at > ?', Time.now - 1.day)
      .order('count DESC').limit(10)
  }
end
