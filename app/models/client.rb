class Client < ApplicationRecord

  has_many :cases

  has_attached_file :avatar, styles: { medium: "300x300>", avatar: "200x200", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/




end
