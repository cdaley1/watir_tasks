require 'watir'
require 'yaml'

browser = Watir::Browser.start "http://tumblr.com/login"

file = YAML.load_file('./details.yml')
  file["credentials"].each do |yml_credentials|
		browser.text_field(id: 'signup_email').set "#{yml_credentials["email"]}"
		browser.text_field(id: 'signup_password').set "#{yml_credentials["password"]}\n"
	end

txtpost = browser.i(class:"icon_post_text")
txtpost.click

title = browser.div(class:"editor-plaintext")
title.send_keys"Testing 123"

body = browser.div(class:"editor-richtext")
body.click
body.send_keys"This is a message"

postbtn = browser.button(class:"create_post_button")
postbtn.click

browser.goto "http://broidontusethis.tumblr.com/"
browser.alert.ok

#Verify
verify = browser.h2(class: 'title')
if verify.text.match /Testing 123/
	puts "Post found: #{verify.text}"
else
	puts "Post not found"
end

#Teardown
browser.quit


