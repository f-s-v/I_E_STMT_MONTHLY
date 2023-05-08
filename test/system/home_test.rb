require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase
  test "visiting the index as anonymous" do
    visit home_index_url
  
    assert_selector "h1", text: "GAIN INSIGHT INTO YOUR FINANCES: GET YOUR PERSONALIZED INCOME & EXPENDITURE STATEMENT NOW!"
    assert_selector "a", text: "SIGN IN"
  end
end
