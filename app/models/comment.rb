class Comment < ActiveRecord::Base
  belongs_to :microposts
  belongs_to :user
end
