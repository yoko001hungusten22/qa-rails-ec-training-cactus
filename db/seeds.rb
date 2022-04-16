# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserClassification.create!(
  user_classification_name: '会社員'
)

User.create!(
  [
    {
      password: 'aaaaaa', 
      last_name: '野原', 
      first_name: 'ひろし', 
      zipcode: '1234567', 
      prefecture: '埼玉県', 
      municipality: '春日部市', 
      address: '3-27-3', 
      email: 'hiroshi@example.com', 
      phone_number: '05068933754', 
      company_name: '双葉商事', 
       user_classification_id: UserClassification.first.id
    },
    {
      password: 'bbbbbb', 
      last_name: '荻野', 
      first_name: '千尋', 
      zipcode: '2345678', 
      prefecture: '香川県', 
      municipality: '高松市', 
      address: '4-23-1', 
      email: 'chihiro@example.com', 
      phone_number: '0353785235', 
      user_classification_id: UserClassification.first.id
    }
  ]        
)

Category.create!(category_name: '寝具')
Category.create!(category_name: '時計')
Category.create!(category_name: '食品')
Category.create!(category_name: '文具')

SaleStatus.create!(sale_status_name: '販売中')
SaleStatus.create!(sale_status_name: '品切れ中')

ProductStatus.create!(product_status_name: '新品')
ProductStatus.create!(product_status_name: '中古')

Product.create!(
  product_name: '枕', 
  category_id: Category.first.id, 
  price: 3000, 
  description: '寝ごごち最高の枕です。', 
  sale_status_id: SaleStatus.first.id, 
  product_status_id: ProductStatus.second.id, 
  regist_date: '2020/07/17', 
  user_id: User.first.id
)
Product.create!(
  product_name: '目覚まし時計', 
  category_id: Category.second.id, 
  price: 1500, description: 'あのキャラクターが起こしてくれます。', 
  sale_status_id: SaleStatus.second.id, 
  product_status_id: ProductStatus.first.id, 
  regist_date: '2020/07/17', 
  user_id: User.first.id
)
Product.create!(
  product_name: 'ドーナツ', 
  category_id: Category.third.id, 
  price: 300, 
  description: '美味しくてカロリーゼロです。', 
  sale_status_id: SaleStatus.first.id, 
  product_status_id: ProductStatus.second.id, 
  regist_date: '2019/04/10', 
  user_id: User.second.id
)
Product.create!(
  product_name: 'ボールペン', 
  category_id: Category.fourth.id, 
  price: 700, description: '書きやすいです。', 
  sale_status_id: SaleStatus.second.id, 
  product_status_id: ProductStatus.first.id, 
  regist_date: '2020/02/02', 
  user_id: User.second.id
)