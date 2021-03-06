module Spree
  class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]
  belongs_to :user
	validates :user_id,:title,:content,:meta_description,:slug, presence: true
  mount_uploader :featured_image, FeaturedImageUploader
  validate :init
  acts_as_list
  default_scope { order(:position) }



  private

  def init
  	if published == true
  		self.published_date = Date.today
  	else
  		self.published_date = nil
  	end

  end

  end
end
