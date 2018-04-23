# == Schema Information
#
# Table name: visitors
#
#  id         :bigint(8)        not null, primary key
#  uid        :string(255)      default("")
#  email      :string(255)      default("")
#  nick_name  :string(255)      default("")
#  gender     :boolean          default(FALSE)
#  city       :string(255)      default("")
#  province   :string(255)      default("")
#  country    :string(255)      default("")
#  avatar_url :string(255)      default("")
#  token      :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_visitors_on_token  (token) UNIQUE
#  index_visitors_on_uid    (uid) UNIQUE
#

class Visitor < ApplicationRecord
  before_save :generate_uid

  def generate_uid
    self.uid = UUIDTools::UUID.sha1_create(UUIDTools::UUID_DNS_NAMESPACE, Time.zone.now.to_s).to_s.delete('-')
    self.token = uid.upcase
  end
end
