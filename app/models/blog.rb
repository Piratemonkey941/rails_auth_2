class Blog < ApplicationRecord
    has_and_belongs_to_many :categories
    belongs_to :user
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 2, maximum: 500 }

    # validates :image_path, presence: true, format: { with: /\Ahttp/ }
  
    validate :image_path_exists
  
    def image_path_exists
      require 'open-uri'
  
      begin
        path = URI.open(image_path)

        
  
        errors.add(:image_path, "Does not contain image content") and return unless path.content_type.starts_with?("image")
      rescue
        errors.add(:image_path, "Invalid URL")
      end
    end
  end
  