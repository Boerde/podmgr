require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    #
    def setup
        @user = User.new(email: "user@example.com",
                        password: "secure", password_confirmation: "secure")
    end

    test "User valid mail" do
        assert @user.valid?
    end

    test "User no mail" do
        @user.email = ""
        assert_not @user.valid?
    end

    test "email is unique" do
        dupli = @user.dup
        dupli.email = @user.email.upcase
        @user.save
        assert_not dupli.valid?
    end

    test "passwort is present" do
        @user.password = @user.password_confirmation = " " * 6
        assert_not @user.valid?
    end
    test "password >= 6 chars" do
        @user.password = @user.password_confirmation = "a" * 5
        assert_not @user.valid?
    end


end
