class Genre < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '和食' },
    { id: 2, name: '中華料理' },
    { id: 3, name: '韓国料理' },
    { id: 4, name: 'アジア料理' },
    { id: 5, name: 'イタリアン' },
    { id: 6, name: 'フレンチ' },
    { id: 7, name: 'カレー' },
    { id: 8, name: '鍋調理' },
    { id: 9, name: 'デザート' },
    { id: 10, name: '創作料理' }
  ]

  include ActiveHash::Associations
  has_many :recipes

  end