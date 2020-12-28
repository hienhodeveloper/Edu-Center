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

PermissionAction.create(
  [
    {
      action_name: "Create Course",
      action_code: "CREATE_COURSE"
    },
    {
      action_name: "Edit Course",
      action_code: "EDIT_COURSE"
    },
    {
      action_name: "Delete Course",
      action_code: "DELETE_COURSE"
    },
    {
      action_name: "Subcribe Course",
      action_code: "SUBCRIBE_COURSE"
    },
    {
      action_name: "Unsubcribe Course",
      action_code: "UNSUBCRIBE_COURSE"
    },
    {
      action_name: "See teacher profile",
      action_code: "SEE_TEACHER_PROFILE"
    },
    {
      action_name: "Update my profile",
      action_code: "UPDATE_MY_PROFILE"
    },
    {
      action_name: "View Course",
      action_code: "VIEW_COURSE"
    },
    {
      action_name: "See all profiles",
      action_code: "SEE_ALL_PROFILE"
    },
    {
      action_name: "View your subcribed course students",
      action_code: "VIEW_SUBCRIBED_COURSE_STUDENTS"
    },
    {
      action_name: "Edit user permission",
      action_code: "EDIT_USER_PERMISSION"
    },
  ]
)

Permission.create([{name_per: 'Owner'}, {name_per: 'Teacher 1'}, {name_per: 'Teacher 2'}, {name_per: 'Student 1'}, {name_per: 'Student 2'}, {name_per: 'Default Permission'}])

# Owner
PermissionDetail.create([
  {
    permission_id: 1,
    permission_action_id: 1,
    licensed: true,
  },
  {
    permission_id: 1,
    permission_action_id: 2,
    licensed: true,
  },
  {
    permission_id: 1,
    permission_action_id: 3,
    licensed: true,
  },
  {
    permission_id: 1,
    permission_action_id: 9,
    licensed: true,
  },
  {
    permission_id: 1,
    permission_action_id: 10,
    licensed: true,
  },
  {
    permission_id: 1,
    permission_action_id: 11,
    licensed: true,
  }
])

# Teacher 1
PermissionDetail.create([
  {
    permission_id: 2,
    permission_action_id: 1,
    licensed: true,
  },
  {
    permission_id: 2,
    permission_action_id: 2,
    licensed: true,
  },
  {
    permission_id: 2,
    permission_action_id: 3,
    licensed: true,
  },
  {
    permission_id: 2,
    permission_action_id: 10,
    licensed: true,
  }
])

# Teacher 2
PermissionDetail.create([
  {
    permission_id: 3,
    permission_action_id: 1,
    licensed: true,
  },
  {
    permission_id: 3,
    permission_action_id: 2,
    licensed: true,
  },
  {
    permission_id: 3,
    permission_action_id: 3,
    licensed: true,
  },
  {
    permission_id: 3,
    permission_action_id: 10,
    licensed: true,
  }
])

# Student 1
PermissionDetail.create([
  {
    permission_id: 4,
    permission_action_id: 4,
    licensed: true,
  },
  {
    permission_id: 4,
    permission_action_id: 5,
    licensed: true,
  }
])

# Student 2
PermissionDetail.create([
  {
    permission_id: 5,
    permission_action_id: 4,
    licensed: true,
  },
  {
    permission_id: 5,
    permission_action_id: 5,
    licensed: true,
  }
])

# Default
PermissionDetail.create([
  {
    permission_id: 6,
    permission_action_id: 6,
    licensed: true,
  },
  {
    permission_id: 6,
    permission_action_id: 7,
    licensed: true,
  },
  {
    permission_id: 6,
    permission_action_id: 8,
    licensed: true,
  }
])

#admin
UserPermission.create({user_id: 1, permission_id: 1, licensed: true})
UserPermission.create({user_id: 1, permission_id: 6, licensed: true})

#teacher
UserPermission.create({user_id: 2, permission_id: 6, licensed: true})
UserPermission.create({user_id: 3, permission_id: 6, licensed: true})

UserPermission.create({user_id: 2, permission_id: 2, licensed: true})
UserPermission.create({user_id: 3, permission_id: 3, licensed: true})

#student
UserPermission.create({user_id: 4, permission_id: 6, licensed: true})
UserPermission.create({user_id: 5, permission_id: 6, licensed: true})

UserPermission.create({user_id: 4, permission_id: 4, licensed: true})
UserPermission.create({user_id: 5, permission_id: 5, licensed: true})