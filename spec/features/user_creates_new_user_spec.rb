require 'rails_helper'

describe 'as a user' do
  describe 'on user create page' do
    before(:each) do
      @user_1 = User.create(name: "Todd", username: "todd_is_awesome@gmail", password: "ILoveMom")
    end

    it 'shows fields for name, username & password' do
      visit new_user_path

      expect(page).to have_content("Please fill out the below fields in order to create a user:")
      expect(page).to have_content("Name")
      expect(page).to have_content("Username")
      expect(page).to have_content("Password")
    end

    it 'can create a new user' do
      name = "tom"
      username = "test@test.com"
      password= "ILoveMom"

      visit '/'

      click_on "Sign Up to Be a User"

      expect(current_path).to eq(new_user_path)

      fill_in :user_name, with: name
      fill_in :user_username, with: username
      fill_in :user_password, with: password

      click_button "Create User"

      expect(current_path).to eq(user_path(User.last.id))
      expect(page).to have_content("Welcome #{name}, you are now logged in!")
    end
  end
end
