# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create({full_name: "Hien Ho Admin", role: "admin", email: "hienhoadmin@yopmail.com", password: "123456", confirmed_at: "2020-12-11 02:01:03"})
User.create({full_name: "Hien Ho Teacher 1", role: "teacher", email: "hienhoteacher1@yopmail.com", password: "123456", confirmed_at: "2020-12-11 02:01:03"})
User.create({full_name: "Hien Ho Teacher 2", role: "teacher", email: "hienhoteacher2@yopmail.com", password: "123456", confirmed_at: "2020-12-11 02:01:03"})

User.create({full_name: "Hien Ho Student 1", role: "student", email: "hienhostudent1@yopmail.com", password: "123456", confirmed_at: "2020-12-11 02:01:03"})
User.create({full_name: "Hien Ho Student 2", role: "student", email: "hienhostudent2@yopmail.com", password: "123456", confirmed_at: "2020-12-11 02:01:03"})

Permission.create([{name_per: 'Owner'}, {name_per: 'BasicReader'}, {name_per: 'BasicWriter'}, {name_per: 'Teacher'}, {name_per: 'Student'}])

# Owner
PermissionDetail.create([
  {
    permission_id: 1,
    action_code: 'CREATE_COURSE',
  },
  {
    permission_id: 1,
    action_code: 'EDIT_COURSE',
  },
  {
    permission_id: 1,
    action_code: 'DELETE_COURSE',
  },
  {
    permission_id: 1,
    action_code: 'CREATE_SUBCRIBE_COURSE',
  },
  {
    permission_id: 1,
    action_code: 'EDIT_SUBCRIBE_COURSE',
  },
  {
    permission_id: 1,
    action_code: 'DELETE_SUBCRIBE_COURSE',
  },
  {
    permission_id: 1,
    action_code: 'CREATE_USER',
  },
  {
    permission_id: 1,
    action_code: 'EDIT_USER',
  },
  {
    permission_id: 1,
    action_code: 'DELETE_USER',
  },
  {
    permission_id: 1,
    action_code: 'VIEW_COURSE',
  },
  {
    permission_id: 1,
    action_code: 'VIEW_USER',
  },  
  {
    permission_id: 1,
    action_code: 'VIEW_FILE',
  },  
  {
    permission_id: 1,
    action_code: 'VIEW_COURSE_CONTENT',
  },
  {
    permission_id: 1,
    action_code: 'VIEW_SUBCRIBE_COURSE',
  },
  {
    permission_id: 1,
    action_code: 'CREATE_FILE',
  },
  {
    permission_id: 1,
    action_code: 'DELETE_FILE',
  },
])

# Basic Reader
PermissionDetail.create([
  {
    permission_id: 2,
    action_code: 'VIEW_COURSE',
  },
  {
    permission_id: 2,
    action_code: 'VIEW_USER',
  },  
  {
    permission_id: 2,
    action_code: 'VIEW_FILE',
  },  
  {
    permission_id: 2,
    action_code: 'VIEW_COURSE_CONTENT',
  },
  {
    permission_id: 2,
    action_code: 'VIEW_SUBCRIBE_COURSE',
  },
])

# Basic Writer
PermissionDetail.create([
  {
    permission_id: 3,
    action_code: 'EDIT_USER',
  },
  {
    permission_id: 3,
    action_code: 'CREATE_FILE',
  },
  {
    permission_id: 3,
    action_code: 'DELETE_FILE',
  },
])

# Teacher
PermissionDetail.create([
  {
    permission_id: 4,
    action_code: 'CREATE_COURSE',
  },
  {
    permission_id: 4,
    action_code: 'EDIT_COURSE',
  },
  {
    permission_id: 4,
    action_code: 'DELETE_COURSE',
  },
])

# Student
PermissionDetail.create([
  {
    permission_id: 5,
    action_code: 'CREATE_SUBCRIBE_COURSE',
  },
  {
    permission_id: 5,
    action_code: 'EDIT_SUBCRIBE_COURSE',
  },
  {
    permission_id: 5,
    action_code: 'DELETE_SUBCRIBE_COURSE',
  }
])

#admin
UserPermission.create({user_id: 1, permission_id: 1, licensed: true})

#teacher
UserPermission.create({user_id: 2, permission_id: 2, licensed: true})
UserPermission.create({user_id: 3, permission_id: 3, licensed: true})

UserPermission.create({user_id: 2, permission_id: 4, licensed: true})
UserPermission.create({user_id: 3, permission_id: 4, licensed: true})

#student
UserPermission.create({user_id: 4, permission_id: 2, licensed: true})
UserPermission.create({user_id: 5, permission_id: 3, licensed: true})

UserPermission.create({user_id: 4, permission_id: 5, licensed: true})
UserPermission.create({user_id: 5, permission_id: 5, licensed: true})