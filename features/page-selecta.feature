Feature: 
    As a behaviour driven developer
    In order to have a DRY, elegant and maintainable test suite
    I want 'page-selecta' to do it's funky thing

    Scenario: A scenario performs a github search
        Given the scenario is on the github homepage
        When the scenario enters "page-selecta" into the search box
        And the scenario clicks the magnifying glass icon
        And the scenario clicks on the "icaruswings / page-selecta" link
        Then the scenario is on the "page-selecta" github repository details page
        And the scenario is on a github repository details page which belongs to "icaruswings"