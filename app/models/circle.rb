# == Schema Information
#
# Table name: circles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  descript   :string(255)
#  cover_url  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Circle < ApplicationRecord
end
