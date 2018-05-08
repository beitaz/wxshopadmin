# == Schema Information
#
# Table name: categories
#
#  id             :bigint(8)        not null, primary key
#  parent_id(父类型) :bigint(8)
#  name(类型名称)     :string(255)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_categories_on_parent_id           (parent_id)
#  index_categories_on_parent_id_and_name  (parent_id,name) UNIQUE
#

class Category < ApplicationRecord
  has_many :children, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy
  belongs_to :parent, class_name: 'Category', optional: true
  validates :name, presence: true, uniqueness: { scope: :parent_id }
  # validates_presence_of :parent_id, unless: -> { base }, message: '必须选择'

  scope :base, -> { where(parent_id: 0) }
  scope :normal, -> { where.not(parent_id: 0) }
end
