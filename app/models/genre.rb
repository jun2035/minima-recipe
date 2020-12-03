class Genre < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '魚料理' },
    { id: 2, name: '肉料理' },
    { id: 3, name: '野菜料理' },
    { id: 4, name: '丼もの・カレー・揚げ物' },
    { id: 5, name: 'お好み焼・粉物' },
    { id: 6, name: 'ラーメン・そば・うどん・パスタ・麺類' },
    { id: 7, name: 'ピザ・ハンバーガー・パン類' },
    { id: 8, name: '鍋類' },
    { id: 9, name: 'スイーツ' },
    { id: 10, name: 'その他・創作料理' },  
  ]

  include ActiveHash::Associations
  has_many :recipes

  end