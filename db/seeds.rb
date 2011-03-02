# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
                 #rake  db:setup re-crear la base de datos
                 #rake db:seed
      Noun.create :word=> 'Hund', :article => 'der', :plural => 'Hunde', :translation => 'perro'
      Noun.create :word=> 'Abend', :article => 'der', :plural => 'Abende', :translation => '(por la) tarde'
      Noun.create :word=> 'Arbeit', :article => 'die', :plural => 'Arbeit', :translation => 'el trabajo'
      Noun.create :word=> 'Backerei', :article => 'die', :plural => 'Backereien', :translation => 'la panaderia'
      Noun.create :word=> 'Bad', :article => 'das', :plural => 'Bader', :translation => 'el banio'
      Noun.create :word=> 'Chef', :article => 'der', :plural => 'Chefs', :translation => 'jefe'
      Noun.create :word=> 'Film', :article => 'der', :plural => 'Filme', :translation => 'la pelicula'
      Noun.create :word=> 'Karte', :article => 'die', :plural => 'Karten', :translation => 'la carta'
      Noun.create :word=> 'Kino', :article => 'das', :plural => 'Kinos', :translation => 'el cine'