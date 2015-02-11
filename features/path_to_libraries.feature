Feature: Path to libraries
  Scenario: Load Ember.js
    Given the Server is running at "path-to-libraries"
    When I go to "/javascripts/application.js"
    Then I should see "Ember.VERSION"
    Then I should see "DS.Model"
