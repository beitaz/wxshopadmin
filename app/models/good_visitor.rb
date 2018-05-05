# == Schema Information
#
# Table name: good_visitors
#
#  id         :bigint(8)        not null, primary key
#  visitor_id :integer
#  good_id    :integer
#  category   :integer
#
# Indexes
#
#  index_good_visitors_on_visitor_id_and_good_id_and_category  (visitor_id,good_id,category) UNIQUE
#

class GoodVisitor < ApplicationRecord
  belongs_to :good
  belongs_to :visitor

  # scope :add, -> { find_or_create_by() }
  # Ex:- scope :active, -> {where(:active => true)}

  # 我的收藏记录
  def self.favorites(visitor_id)
    gvs = GoodVisitor.where(visitor_id: visitor_id, category: 2)
    Good.where(id: gvs.map(&:good_id))
  end

  # 我的访问记录
  def self.visites(visitor_id)
    gvs = GoodVisitor.where(visitor_id: visitor_id, category: 1)
    Good.where(id: gvs.map(&:good_id))
  end

  # 是否已收藏
  def self.favorited?(visitor_id, good_id)
    find_by(visitor_id: visitor_id, good_id: good_id, category: 2).present?
  end

  # 是否已访问
  def self.visited?(visitor_id, good_id)
    find_by(visitor_id: visitor_id, good_id: good_id, category: 1).present?
  end

  # 添加收藏记录
  def self.favorite(visitor_id, good_id)
    GoodVisitor.find_or_create_by(visitor_id: visitor_id, good_id: good_id, category: 2)
  end

  # 添加访问记录
  def self.visit(visitor_id, good_id)
    GoodVisitor.find_or_create_by(visitor_id: visitor_id, good_id: good_id, category: 1)
  end

  # 删除收藏记录
  def self.unfavorite(visitor_id, good_id)
    GoodVisitor.find_by(visitor_id: visitor_id, good_id: good_id, category: 2).destroy
  end

  # 删除访问记录
  def self.unvisit(visitor_id, good_id)
    gv = GoodVisitor.find_by(visitor_id: visitor_id, good_id: good_id, category: 1)
    gv.destroy
  end
end
