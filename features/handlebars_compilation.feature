Feature: Handlebars compilation
  Scenario: Tempalte writen by HTMLBars
    Given the Server is running at "handlebars-compilation"
    When I go to "/javascripts/templates.js"
    Then I should see 'Ember.TEMPLATES["ok-button"]'

  Scenario: Access template as JS file
    Given the Server is running at "handlebars-compilation"
    When I go to "/javascripts/templates/ok-button.js"
    Then I should see 'Ember.TEMPLATES["ok-button"]'
