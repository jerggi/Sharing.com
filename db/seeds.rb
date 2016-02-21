# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
c1 = Category.create(name: "Clothes", avatar: File.open(Rails.root.join('public', 'images', 'clothes.jpeg')))
c2 = Category.create(name: "Cars", avatar: File.open(Rails.root.join('public', 'images', 'cars.png')))
c3 = Category.create(name: "Kitchen", avatar: File.open(Rails.root.join('public', 'images', 'kitchen.png')))
c4 = Category.create(name: "Tools", avatar: File.open(Rails.root.join('public', 'images', 'tools.png')))
c5 = Category.create(name: "Electronics", avatar: File.open(Rails.root.join('public', 'images', 'electronics.jpg')))

i1 = Item.create(name: "Helmet", content: "prilba patri k vybave", price: 3, unit: 1,
location: "Bratislava", rent: false, avatar: File.open(Rails.root.join('public', 'images', 'helmet.jpg')))
i2 = Item.create(name: "Ski jacket", content: "lyziarska bunda velkost L", price: 5,
unit: 1, location: "Brno", rent: false, avatar: File.open(Rails.root.join('public', 'images', 'skijacket.jpg')))
i3 = Item.create(name: "Prives", content: "nosnost 1000 kg", price: 15, unit: 1,
location: "Bratislava", rent: false, avatar: File.open(Rails.root.join('public', 'images', 'trailer.jpg')))
i4 = Item.create(name: "Skoda oktavia", content: "diesiel, manual, nefajcit vnutri", price: 20, unit: 1,
location: "Brno", rent: false, avatar: File.open(Rails.root.join('public', 'images', 'octavia.jpg')))
i5 = Item.create(name: "Mixer", content: "Vhodny na mixovanie vsetkeho", price: 9, unit: 1, location: "Bratislava",
rent: false, avatar: File.open(Rails.root.join('public', 'images', 'mixer.jpg')))
i6 = Item.create(name: "Hadica", content: "dlzka 10 metrov", price: 1, unit: 0, location: "Bratislava",
rent: false, avatar: File.open(Rails.root.join('public', 'images', 'hadica.jpg')))
i7 = Item.create(name: "Monitor", content: "27 palcov, led, full hd, hdmi + vga", price: 1, unit: 0,
location: "Brno", rent: false, avatar: File.open(Rails.root.join('public', 'images', 'monitor.jpg')))
i8 = Item.create(name: "Tlaciaren", content: "pridte si to vytlacit ale ku mne domov:D", price: 9, unit: 1,
location: "Brno", rent: false, avatar: File.open(Rails.root.join('public', 'images', 'printer.jpg')))

igor = User.create(name: 'Igor', email: 'igor@sharing.com', password: 'igorjeadmin', role: 'admin')
fero = User.create(name: 'Fero', email: 'fero@gmail.com', password: 'ferojeuser', role: nil)
jano = User.create(name: 'Jano', email: 'jano@gmail.com', password: 'janojeuser', role: nil)
jozo = User.create(name: 'Jozo', email: 'jozo@gmail.com', password: 'jozojeuser', role: nil)

fero.items << [i6, i8]
jano.items << [i3, i5, i7]
jozo.items << [i1, i2, i4]

c1.items << [i1, i2]
c2.items << [i3, i4]
c3.items << [i5]
c4.items << [i6]
c5.items << [i7, i8]
