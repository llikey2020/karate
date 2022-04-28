@ignore
Feature: Testing Template for Batch Job POST Requests

Scenario:
    Given url 'http://staging.planetrover.ca:32499/batch-job'
    And path __arg.path
    And def payload = read("./data/" + __arg.template + '.json')
    And print payload
    And request payload
    When method POST
    And print responseStatus
    And match header Content-Type contains 'text/plain'
    And match header Connection contains 'keep-alive' 
    And print responseTime
    And print response