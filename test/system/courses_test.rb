require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  setup do
    @course = courses(:one)
  end

  test "visiting the index" do
    visit courses_url
    assert_selector "h1", text: "Courses"
  end

  test "creating a Course" do
    visit courses_url
    click_on "New Course"

    fill_in "Address", with: @course.address
    fill_in "Condition", with: @course.condition
    fill_in "Course content", with: @course.course_content
    fill_in "Degree", with: @course.degree
    fill_in "Goal", with: @course.goal
    fill_in "Introduction", with: @course.introduction
    fill_in "Name", with: @course.name
    fill_in "Price", with: @course.price
    fill_in "Status", with: @course.status
    click_on "Create Course"

    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "updating a Course" do
    visit courses_url
    click_on "Edit", match: :first

    fill_in "Address", with: @course.address
    fill_in "Condition", with: @course.condition
    fill_in "Course content", with: @course.course_content
    fill_in "Degree", with: @course.degree
    fill_in "Goal", with: @course.goal
    fill_in "Introduction", with: @course.introduction
    fill_in "Name", with: @course.name
    fill_in "Price", with: @course.price
    fill_in "Status", with: @course.status
    click_on "Update Course"

    assert_text "Course was successfully updated"
    click_on "Back"
  end

  test "destroying a Course" do
    visit courses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course was successfully destroyed"
  end
end
