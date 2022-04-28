@ignore
Feature: Testing Template for Batch Job GET Requests

Scenario:
    Given url 'http://staging.planetrover.ca:32499/batch-job'
    And path __arg.path + __arg.name
    When method GET
    Then status 405
    And match header Content-Type contains 'text/plain'
    And match header Connection contains 'keep-alive' 
    And print responseTime
    And print response