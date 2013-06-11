Feature: Handlebars compilation
  Scenario: Tempalte writen by handlebars
    Given the Server is running at "handlebars-compilation"
    When I go to "/javascripts/templates.js"
    Then I should see 'Ember.TEMPLATES["ok_button"]'
