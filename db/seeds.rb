
Adoption.destroy_all
Owner.destroy_all
Pet.destroy_all

# #dogs api
# response_dog = RestClient.get('https://api.petfinder.com/v2/animals?type=dog&page=2', headers= {'Authorization': "Bearer #{ENV['AUTH_TOKEN']}"})
# dogs_data = JSON.parse(response_dog)['animals']

# #creation of dogs
# 20.times do |i|

#   random_pics = RestClient.get('https://dog.ceo/api/breeds/image/random')
#   dog_pics_data = JSON.parse(random_pics)["message"]

#   Dog.create!(
#     name: dogs_data[i]["name"],
#     gender: dogs_data[i]["gender"],
#     age: dogs_data[i]["age"], #age is a string 
#     img_url: dog_pics_data 
#     )
# end

# #cats api
# response_cat = RestClient.get('https://api.petfinder.com/v2/animals?type=cat&page=2', headers= {'Authorization': "Bearer #{ENV['AUTH_TOKEN']}"})
# cats_data = JSON.parse(response_cat)['animals']

# #creation of cats 
# 20.times do |i|

#   random_cat_pics = RestClient.get('https://api.thecatapi.com/v1/images/search', headers= {'Authorization': "Bearer #{ENV['x-api-key']}"})
#   cat_pics_data = JSON.parse(random_cat_pics)


#   Cat.create!(
#     name: cats_data[i]["name"],
#     gender: cats_data[i]["gender"],
#     age: cats_data[i]["age"], #age is a string 
#     img_url: cat_pics_data[0]["url"] 
#     )
# end

# Pet seeds ------------------------------------------------

#cats api
response_cat = RestClient.get('https://api.petfinder.com/v2/animals?type=cat&page=2', headers= {'Authorization': "Bearer #{ENV['AUTH_TOKEN']}"})
cats_data = JSON.parse(response_cat)['animals']

#creation of cats 
15.times do |i|

  random_cat_pics = RestClient.get('https://api.thecatapi.com/v1/images/search', headers= {'Authorization': "Bearer #{ENV['x-api-key']}"})
  cat_pics_data = JSON.parse(random_cat_pics)


  Pet.create!(
    name: cats_data[i]["name"],
    species: "Cat",
    gender: cats_data[i]["gender"],
    age: cats_data[i]["age"], #age is a string 
    img_url: cat_pics_data[0]["url"] 
    )
end



#creation of dogs 
#dogs api
response_dog = RestClient.get('https://api.petfinder.com/v2/animals?type=dog&page=2', headers= {'Authorization': "Bearer #{ENV['AUTH_TOKEN']}"})
dogs_data = JSON.parse(response_dog)['animals']

#creation of dogs
15.times do |i|

  random_pics = RestClient.get('https://dog.ceo/api/breeds/image/random')
  dog_pics_data = JSON.parse(random_pics)["message"]

  Pet.create!(
    name: dogs_data[i]["name"],
    species: "Dog",
    gender: dogs_data[i]["gender"],
    age: dogs_data[i]["age"], #age is a string 
    img_url: dog_pics_data 
    )
end

#owner and adoption seeds -----------------------------------------------


#creation of owner and adoption
5.times do 
  Owner.create!(name: Faker::Name.name, username: Faker::Ancient.primordial, password_digest: Faker::Ancient.hero)
end


Adoption.create!(owner: Owner.first, pet: Pet.first)



# Adoption.create!(owner: Owner.second, dog: Dog.second, cat: Cat.second)
# Adoption.create!(owner: Owner.third, dog: Dog.third, cat: Cat.third)
# Adoption.create!(owner: Owner.fourth, dog: Dog.fourth, cat: Cat.fourth)
# Adoption.create!(owner: Owner.fifth, dog: Dog.fifth, cat: Cat.fifth)



# def nil_check(data)
#   response = RestClient.get('https://api.petfinder.com/v2/animals?type=dog&page=2', headers= {'Authorization': "Bearer #{ENV['AUTH_TOKEN']}"})
#   dogs_data = JSON.parse(response)['animals']
#   if data == nil || data == []
#     img_url = "https://bit.ly/2lY2dkh"
#   else
#     img_url = dogs_data[0]["photos"][0]["small"]
#   end 
# end


  # new_dog = Dog.create!(
    #   name: dogs_data[0]["name"],
    #   breed: dogs_data[0]["breeds"]["primary"],
    #   gender: dogs_data[0]["gender"],
    #   age: dogs_data[0]["age"], #age is a string 
    #   img_url: nil_check(dogs_data[0]["photos"])
    # )  
    ## => <Dog id: 10, name: "Edna", breed: "Chihuahua", gender: "Female", age: "Adult", img_url: "https://bit.ly/2lY2dkh", created_at: "2019-09-07 14:06:43", updated_at: "2019-09-07 14:06:43">

    
  
