class User < ApplicationRecord
    acts_as_voter
    devise :database_authenticatable, :registerable, :recoverable, :rememberable,  :validatable, :omniauthable, omniauth_providers: [:kakao, :naver, :twitter, :facebook, :apple, :google_oauth2, :github]
    validates_presence_of :email,:name
    validates_uniqueness_of :email
    validates_length_of :name, within: 1..60, allow_blank: false
    validates :password, length: { in: 6..128 }, on: :create
    validates :password, length: { in: 6..128 }, on: :update, allow_blank: true
    has_many :users_questions, :dependent=>:destroy
    has_many :questions, :through=>:users_questions
    has_one :user_data
    belongs_to :education
    belongs_to :live_type
    has_many :users_families
    has_many :families, :through=>:users_families

    accepts_nested_attributes_for :families, :allow_destroy => true, reject_if: :reject_families
    mount_uploader :photo, UserUploader

    def reject_families(attributes)
      attributes[:family_category_id].blank?
    end
end
