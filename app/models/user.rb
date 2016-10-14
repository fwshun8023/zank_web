# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  avatar     :string(255)
#  email      :string(255)
#  phone      :string(255)
#  age        :integer
#  height     :integer
#  weight     :integer
#  sex_type   :string(255)
#  province   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
end
