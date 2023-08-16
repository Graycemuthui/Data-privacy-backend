user1 = User.create!(
  username: 'user1',
  password: 'password1',
  email: 'userone@example.com',
  first_name: 'Jane',
  last_name: 'Doe',
  due_date: Date.new(2023, 9, 15),
  phone_number: '+1234567890'
)

user2 = User.create!(
  username: 'user2',
  password: 'password2',
  email: 'usertwo@example.com',
  first_name: 'Alice',
  last_name: 'Smith',
  due_date: Date.new(2023, 8, 30),
  phone_number: '+9876543210'
)

facility1 = Facility.create!(
  facility_name: 'Agha Khan Hospital',
  facility_phone_number: '+5551234567',
  facility_location: 'Nairobi, Kenya',
  facility_description: 'Healthcare Clinic A is a full-service clinic with a focus on women\'s health.',
  role: 'Admin'
)

appointment1 = Appointment.create!(
  appointment_type: 'Prenatal',
  appointment_date: Date.new(2023, 9, 5),
  appointment_time: Time.new(2023, 9, 5, 10, 0, 0, '+05:00'),
  facility: facility1,  # Use the facility1 object here
  user: user1
)

appointment2 = Appointment.create!(
  appointment_type: 'Prenatal',
  appointment_date: Date.new(2023, 8, 25),
  appointment_time: Time.new(2023, 8, 25, 10, 0, 0, '+05:00'),
  facility: facility1,  # Use the facility1 object here
  user: user2
)

reminder1 = Reminder.create!(
  reminder_date: appointment1.appointment_date - 1.day,
  appointment: appointment1,
  user: user1
)

reminder2 = Reminder.create!(
  reminder_date: appointment2.appointment_date - 1.day,
  appointment: appointment2,
  user: user2
)
