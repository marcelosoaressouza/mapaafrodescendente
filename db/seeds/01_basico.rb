# encoding: utf-8

user_admin = User.create! :email     => 'admin@localhost.org',
                          :password  => '123456789',
                          :password_confirmation => '123456789',
                          :admin => true
