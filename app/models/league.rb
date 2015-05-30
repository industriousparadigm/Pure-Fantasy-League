class League < ActiveRecord::Base

  has_many :managers do
    def pending_invitation
      unscoped.where.not invitation_token: nil
    end
  end
  has_many :users, through: :managers
  validates :title, presence: true,
                    uniqueness: { case_sensitive: false }
  normalize_attribute :title

  def to_s
    title
  end

end
