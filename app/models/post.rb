# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  city          :string(255)
#  title         :string(255)
#  content       :text(65535)
#  timestamp     :string(255)
#  comment_count :integer
#  cover_url     :string(255)
#  img_small     :text(65535)
#  img_big       :text(65535)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Post < ApplicationRecord
  belongs_to :user
end
