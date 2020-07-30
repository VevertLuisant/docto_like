# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
JoinTableSpecialtyDoctor.destroy_all
City.destroy_all

#create specialties
specialty1 = Specialty.create(name: "dentiste")
specialty2 = Specialty.create(name: "urologue")
specialty3 = Specialty.create(name: "allergologue")
specialty4 = Specialty.create(name: "podologue")
specialty5 = Specialty.create(name: "chirurgien")
specialty6 = Specialty.create(name: "proctologue")
specialty7 = Specialty.create(name: "oncologue")
specialty8 = Specialty.create(name: "gastro-entérologue")
specialty9 = Specialty.create(name: "magnétiseur")
specialty10 = Specialty.create(name: "obstétricien")
puts "10 specialties created"

#create cities
city1 = City.create(name: 'Clermont-Ferrand')
city2 = City.create(name: 'Québec')
city3 = City.create(name: 'Paris')
city4 = City.create(name: 'Bordeaux')
city5 = City.create(name: 'Berlin')
city6 = City.create(name: 'Strasbourg')
city7 = City.create(name: 'Lyon')
city8 = City.create(name: 'Roubaix')
city9 = City.create(name: 'Lille')
city10 = City.create(name: 'Nantes')
puts " 10 cities created"

#create all the values in the table
100.times do
  doctor = Doctor.create(first_name: "Dr.#{Faker::Name.first_name}", last_name: Faker::Name.last_name, zip_code: rand(10000..80000))#create Doctor
  doctor.city = [city1, city2, city3, city4, city5, city6, city7, city8, city9, city10 ].sample #add city to doctor
  doctor.save
  patient = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)#create patient
  patient.city = [city1, city2, city3, city4, city5, city6, city7, city8, city9, city10 ].sample#add city to patient
  patient.save
  appointment = Appointment.create(doctor: doctor, patient: patient)#create appointment
  appointment.city = [city1, city2, city3, city4, city5, city6, city7, city8, city9, city10].sample#add city to appointment
  appointment.save
  #add 2 specialty per doctor
  join_table_specialty_doctor =  JoinTableSpecialtyDoctor.create(doctor: doctor, specialty: [specialty1, specialty2, specialty3].sample)
  join_table_specialty_doctor2 =  JoinTableSpecialtyDoctor.create(doctor: doctor, specialty: [specialty4, specialty5, specialty6].sample)
  join_table_specialty_doctor3 =  JoinTableSpecialtyDoctor.create(doctor: doctor, specialty: [specialty7, specialty8, specialty9].sample)
  join_table_specialty_doctor4 =  JoinTableSpecialtyDoctor.create(doctor: doctor, specialty: [specialty10, specialty1, specialty2].sample)
end

puts "All values have been created (100 doctors, 100 patients, 100 appointments)!"