
Adoption.destroy_all
Dog.destroy_all
Owner.destroy_all

response = RestClient.get('https://api.petfinder.com/v2/animals?type=dog&page=2', headers= {'Authorization': "Bearer #{ENV['AUTH_TOKEN']}"})
dogs_data = JSON.parse(response)['animals']


5.times do |i|

  random_pics = RestClient.get('https://dog.ceo/api/breeds/image/random')
  dog_pics_data = JSON.parse(random_pics)["message"]

  Dog.create!(
    name: dogs_data[i]["name"],
    breed: dogs_data[i]["breeds"]["primary"],
    gender: dogs_data[i]["gender"],
    age: dogs_data[i]["age"], #age is a string 
    img_url: dog_pics_data #currently showing random pictures since not every dog has a picture 
    )
end

  # new_dog = Dog.create!(
    #   name: dogs_data[0]["name"],
    #   breed: dogs_data[0]["breeds"]["primary"],
    #   gender: dogs_data[0]["gender"],
    #   age: dogs_data[0]["age"], #age is a string 
    #   img_url: nil_check(dogs_data[0]["photos"])
    # )  
    ## => <Dog id: 10, name: "Edna", breed: "Chihuahua", gender: "Female", age: "Adult", img_url: "https://bit.ly/2lY2dkh", created_at: "2019-09-07 14:06:43", updated_at: "2019-09-07 14:06:43">

    
    # def nil_check(data)
    #   if data == nil || data == []
    #     img_url = "https://bit.ly/2lY2dkh"
    #   else
    #     img_url = dogs_data[0]["photos"][0]["small"]
    #   end 
    # end


5.times do 
  Owner.create!(name: Faker::Name.name)
end


Adoption.create!(owner: Owner.first, dog: Dog.first)
Adoption.create!(owner: Owner.second, dog: Dog.second)
Adoption.create!(owner: Owner.third, dog: Dog.third)
Adoption.create!(owner: Owner.fourth, dog: Dog.fourth)
Adoption.create!(owner: Owner.fifth, dog: Dog.fifth)