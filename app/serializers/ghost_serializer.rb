class GhostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :username, :age, :image, :roles, :motto, :credits, :featured, :profile_picture
  has_many :haunts
  has_many :houses, through: :haunts
  has_many :searches
  has_many :properties

  def profile_picture
    # rails_blob_path(object.profile_picture, only_path: true) if object.profile_picture.attached?
    # url_for(object.profile_picture, :only_path => true) if object.profile_picture.attached?
    # rails_representation_url(object.profile_picture, :only_path => true) if object.profile_picture.attached?
    if object.profile_picture.attached?
      object.profile_picture.service_url
      # rails_blob_path(object.profile_picture, disposition: "attachment", only_path: true)
    end
  end


end
