# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.create(category_name: '寝具')
Category.create(category_name: '時計')
Category.create(category_name: '食品')
Category.create(category_name: '文具')

SaleStatus.create(sale_status_name: '販売中')
SaleStatus.create(sale_status_name: '品切れ中')

ProductStatus.create(product_status_name: '新品')
ProductStatus.create(product_status_name: '中古')

Product.create(product_name: '枕', category_id: Category.first.id, price: 3000, description: '寝ごごち最高の枕です。', sale_status_id: SaleStatus.first.id, product_status_id: ProductStatus.second.id, regist_date: '2020/07/17', user_id: User.first.id)
Product.create(product_name: '目覚まし時計', category_id: Category.second.id, price: 1500, description: 'あのキャラクターが起こしてくれます。', sale_status_id: SaleStatus.second.id, product_status_id: ProductStatus.first.id, regist_date: '2020/07/17', user_id: User.first.id)
Product.create(product_name: 'ドーナツ', category_id: Category.third.id, price: 300, description: '美味しくてカロリーゼロです。', sale_status_id: SaleStatus.first.id, product_status_id: ProductStatus.second.id, regist_date: '2019/04/10', user_id: User.second.id)
Product.create(product_name: 'ボールペン', category_id: Category.fourth.id, price: 700, description: '書きやすいです。', sale_status_id: SaleStatus.second.id, product_status_id: ProductStatus.first.id, regist_date: '2020/02/02', user_id: User.second.id)