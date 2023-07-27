class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :kind , acceptance: {
    accept: %w[like dislike],
  }

  def self.kinds
    %w[like dislike]
  end
end
