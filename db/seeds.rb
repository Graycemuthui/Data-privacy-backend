user1 = User.create!(
  username: 'user1',
  password: 'password1',
  email: 'janedoe@gmail.com',
  first_name: 'Jane',
  last_name: 'Doe',
  phone_number: '+1234567890',
  due_date: Date.new(2023, 9, 15)
)

user2 = User.create!(
  username: 'user2',
  password: 'password2',
  email: 'alicesmith@gmail.com',
  first_name: 'Alice',
  last_name: 'Smith',
  phone_number: '+9876543210',
  due_date: Date.new(2023, 8, 30)
)

facility1 = Facility.create!(
  user: user1,
  facility_name: 'Agha Khan Hospital',
  facility_phone_number: '+5551234567',
  facility_location: 'Nairobi, Kenya',
  facility_description: 'Healthcare Clinic A is a full-service clinic with a focus on women\'s health.'
)

appointment1 = Appointment.create!(
  user: user1,
  facility: facility1,
  appointment_type: 'Prenatal',
  appointment_date: Date.new(2023, 9, 5),
  appointment_time: Time.new(2023, 9, 5, 10, 0, 0, '+05:00')
)

appointment2 = Appointment.create!(
  user: user2,
  facility: facility1,
  appointment_type: 'Prenatal',
  appointment_date: Date.new(2023, 8, 25),
  appointment_time: Time.new(2023, 8, 25, 10, 0, 0, '+05:00')
)

Reminder.create!(
  user: user1,
  appointment: appointment1,
  reminder_date: appointment1.appointment_date - 1.day
)

Reminder.create!(
  user: user2,
  appointment: appointment2,
  reminder_date: appointment2.appointment_date - 1.day
)
