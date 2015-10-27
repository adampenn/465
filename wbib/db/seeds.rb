# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
topics = Topic.create(
  [
    {title: 'dogs', description: 'beastiality'},
    {title: 'cats', description: 'cats get scared easy'},
    {title: 'horses', description: 'horses are huge ;)'}
  ]
)

references = Reference.create(
  [
    {URL: 'http://www.animalplanet.com/dog-breed-selector/', topic_id: topics[0].id},
    {URL: 'https://www.petfinder.com/dog-breeds/', topic_id: topics[0].id },
    {URL: 'http://www.animalplanet.com/pets/dogs/', topic_id: topics[0].id },
    {URL: 'http://www.cnn.com/2015/10/26/health/vegetarian-hot-dogs-contain-meat-clear-foods-feat/', topic_id: topics[0].id },
    {URL: 'https://en.wikipedia.org/wiki/Cat', topic_id: topics[1].id },
    {URL: 'http://mashable.com/category/cats/', topic_id: topics[1].id },
    {URL: 'https://en.wikipedia.org/wiki/Horse', topic_id: topics[2].id },
    {URL: 'http://www.ansi.okstate.edu/breeds/horses', topic_id: topics[2].id }
  ]
)

