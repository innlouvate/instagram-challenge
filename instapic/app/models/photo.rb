class Photo < ActiveRecord::Base

  belongs_to :user
  has_many :thumbs, dependent: :destroy
  has_many :comments, dependent: :destroy

  # validates :name, length: {minimum: 2}, uniqueness: true

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def build_comment(attributes = {}, user)
    comment = comments.build(attributes)
    comment.user = user
    comment
  end

end
