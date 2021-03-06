# == Schema Information
#
# Table name: blog_items
#
#  id             :integer       not null, primary key
#  site_id        :integer       
#  name           :string(255)   
#  body           :text          
#  album_id       :integer       
#  person_id      :integer       
#  bloggable_id   :integer       
#  bloggable_type :string(255)   
#  created_at     :datetime      
#

class BlogItem < ActiveRecord::Base
  belongs_to :person
  belongs_to :site
  belongs_to :bloggable, :polymorphic => true
  scope_by_site_id
  validates_inclusion_of :bloggable_type, :in => %w(Verse Recipe Note Picture)
end
