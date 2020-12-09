class Gender < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '男' },
    { id: 2, name: '女' },
    { id: 3, name: '未回答' }
  ]

  include ActiveHash::Associations
  has_many :users

  end