class Blog < ApplicationRecord
  validates :title, :text, presence: true

  def as_json
    super.merge('created_at' => self.created_at.strftime("%d-%m-%Y"))
  end
end
