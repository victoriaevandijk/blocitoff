require 'rails_helper'

describe "the signup process" do

  before do
    @user = create(:user)
    visit root_path
    click_link 'Sign Up'
    fill_in 'Name', with: @user.name
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    fill_in 'Password confirmation', with: @user.password
    click_button 'Sign up'
  end

  it "user receives an email" do
    # code to test if user received email
  end

  it "returns an error when signing up with an email already in use" do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Name', with: @user.name
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    fill_in 'Password confirmation', with: @user.password
    click_button 'Sign up'
    expect( page ).to have_content("Email has already been taken")
  end
end

describe "signing up with invalid email" do
  before do
    @user = create(:user)
  end

  it "returns error when invalid email is used" do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Name', with: @user.name
    fill_in 'Email', with: "invalid@email"
    fill_in 'Password', with: @user.password
    fill_in 'Password confirmation', with: @user.password
    click_button 'Sign up'
    expect( page ).to have_content("Email is invalid")
  end
end

describe "signing the user in and out" do
  before do
    @user = create(:user)
    @user.skip_confirmation!
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign in'
  end

  it "displays user name when signed in" do
    expect( page ).to have_content("Hello #{@user.email}!")
  end

  it "displays sign in and sign out when user is signed out" do
    click_link 'Sign Out'
    find_link('Sign In').visible?
    find_link('Sign Up').visible?
  end

  it "user receives email when reset password is clicked" do
    # code checks for reset password email
  end
end