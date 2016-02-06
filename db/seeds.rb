# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
c1 = Category.create(name: "Clothes")
c2 = Category.create(name: "Cars")
c3 = Category.create(name: "Kitchen")
c4 = Category.create(name: "Garden")
c5 = Category.create(name: "Electronics")

i1 = Item.create(name: "Helmet", content: "prilba patri k vybave")
i2 = Item.create(name: "Ski jacket", content: "lyziarska bunda velkost L")
i3 = Item.create(name: "Prives", content: "nosnost 100 kg")
i4 = Item.create(name: "Skoda oktavia", content: "diesiel, manual, nefajcit vnutri")
i5 = Item.create(name: "Mixer", content: "Vhodny na mixovanie vsetkeho")
i6 = Item.create(name: "Hadica", content: "dlzka 10 metrov")
i7 = Item.create(name: "Monitor", content: "27 palcov, led, full hd, hdmi + vga")
i8 = Item.create(name: "Tlaciaren", content: "pridte si to vytlacit ale ku mne domov:D")

c1.items << [i1, i2]
c2.items << [i3, i4]
c3.items << [i5]
c4.items << [i6]
c5.items << [i7, i8]
