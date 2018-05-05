# == Schema Information
#
# Table name: visitors
#
#  id                     :bigint(8)        not null, primary key
#  uid                    :string(255)      default("")
#  email                  :string(255)      default("")
#  nick_name              :string(255)      default("")
#  mobile                 :string(255)      default("")
#  gender(0:未知, 1:男, 2:女) :integer          default(0)
#  city                   :string(255)      default("")
#  province               :string(255)      default("")
#  country                :string(255)      default("")
#  avatar_url             :string(255)      default("")
#  openid                 :string(255)      default(""), not null
#  token                  :string(255)      default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_visitors_on_openid  (openid) UNIQUE
#  index_visitors_on_token   (token) UNIQUE
#  index_visitors_on_uid     (uid) UNIQUE
#

class Visitor < ApplicationRecord
  has_many :orders
  has_many :good_visitors
  has_many :goods, through: :good_visitors
end
