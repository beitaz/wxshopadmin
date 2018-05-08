# == Schema Information
#
# Table name: resources
#
#  id            :bigint(8)        not null, primary key
#  name          :string(255)
#  resource_id   :integer
#  resource_type :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_resources_on_name                           (name)
#  index_resources_on_resource_id_and_resource_type  (resource_id,resource_type)
#

class Resource < ApplicationRecord
  belongs_to :classable, polymorphic: true
end
