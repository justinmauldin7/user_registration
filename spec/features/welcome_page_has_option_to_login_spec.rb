require 'rails_helper'

describe 'as a user' do
  describe 'on the welcome page' do
    it 'allows ability to login if already a user' do
      user = User.create(username: "funbucket13", password: "test")

      visit '/'

      click_on "I already have an account"

      expect(current_path).to eq(login_path)
      fill_in "username", with: user.username
      fill_in "Password", with: user.password

      click_on "Login"

      expect(current_path).to eq(user_path(user))

      expect(page).to have_content("Welcome, #{user.name}")
      expect(page).to have_content("Log out")
    end
  end
end
