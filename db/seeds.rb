Profile.delete_all
Booking.delete_all
Photo.delete_all
Theme.delete_all
Room.delete_all
User.delete_all

# themes
modern_and_minimal = Theme.create(name: "Modern and Minimal")
sleek_and_sophisticated = Theme.create(name: "Sleek and Sophisticated")
warm_and_cozy = Theme.create(name: "Warm and Cozy")
room_with_a_view = Theme.create(name: "Room with a View")
elegant_and_ornate = Theme.create(name: "Elegant and Ornate")
a_mans_touch = Theme.create(name: "A Man's Touch")
white_washed = Theme.create(name: "White Washed")
tempting_terrace = Theme.create(name: "Tempting Terrace")

# users
parnian = User.create(email: "parnian@gmail.com", password: "parnian")
alwik = User.create(email: "alwik@gmail.com", password: "abcd1234")
frits = User.create(email: "frits@gmail.com", password: "paralwik")

# Photos
photo1 = Photo.create(remote_image_url: "http://res.cloudinary.com/dgf0jyrou/image/upload/v1490197130/6_kfxulh.png")
photo2 = Photo.create(remote_image_url: "http://res.cloudinary.com/dgf0jyrou/image/upload/v1490197130/3_vdtihg.png")
photo3 = Photo.create(remote_image_url: "http://res.cloudinary.com/dgf0jyrou/image/upload/v1490197130/5_isl9pq.png")

photo4 = Photo.create(remote_image_url: "http://res.cloudinary.com/dgf0jyrou/image/upload/v1490197129/4_zugc8d.png")
photo5 = Photo.create(remote_image_url: "http://res.cloudinary.com/dgf0jyrou/image/upload/v1490197128/2_lpm4to.jpg")
photo6 = Photo.create(remote_image_url: "http://res.cloudinary.com/dgf0jyrou/image/upload/v1490197128/1_djf05n.jpg")

# rooms
room1 = Room.create(home_type: "House", room_type: "Shared", accommodate: 2, bedroom_count: 2, bathroom_count: 3, listing_name: "You will never forget your stay!", description: "Normcore meh put a bird on it man braid mumblecore, locavore synth swag kogi helvetica ugh health goth twee raw denim readymade.", address: "Colon 58, 1B, 11100 Cadiz (Spain)", has_tv: false, has_kitchen: true, has_airco: false, has_heating: false, has_internet: true, price: 100, active: true, user: parnian, themes: [modern_and_minimal, sleek_and_sophisticated], photos: [photo1, photo2, photo3])

room2 = Room.create(home_type: "House", room_type: "Shared", accommodate: 2, bedroom_count: 2, bathroom_count: 3, listing_name: "A place in the middle of Holland", description: "Freegan yuccie everyday carry tote bag you probably haven't heard of them godard.", address: "Daguerrestraat 23, 1054TG Utrecht (Netherlands)", has_tv: false, has_kitchen: true, has_airco: false, has_heating: false, has_internet: true, price: 100, active: true, user: alwik, themes: [warm_and_cozy, a_mans_touch],photos: [photo4, photo5, photo6])

room3 = Room.create(home_type: "House", room_type: "Shared", accommodate: 2, bedroom_count: 2, bathroom_count: 3, listing_name: "Great for a Weekend", description: "Meditation tattooed lumbersexual street art truffaut pour-over, kale chips pitchfork. Readymade snackwave man bun, photo booth tilde wolf occupy fashion axe VHS authentic PBR&B typewriter. Vape everyday carry meditation try-hard hammock unicorn.", address: "Tottenham Court Road 14, W1T 1JY London (UK)", has_tv: false, has_kitchen: true, has_airco: false, has_heating: false, has_internet: true, price: 100, active: true, user: alwik, themes: [elegant_and_ornate, white_washed])

# bookings
Booking.create(room: room1, user: alwik, price: 50, total: 100, starts_at: 10.days.from_now, ends_at: 12.days.from_now)
Booking.create(room: room1, user: frits, price: 50, total: 200, starts_at: 20.days.from_now, ends_at: 24.days.from_now)
Booking.create(room: room3, user: frits, price: 50, total: 200, starts_at: 2.days.from_now, ends_at: 4.days.from_now)
