require 'watir'

browser = Watir::Browser.new

browser.goto "http://amazon.co.uk"

sbox = browser.text_field

sbox.set"Elequent ruby"

search = browser.element class: "nav-input"

search.click