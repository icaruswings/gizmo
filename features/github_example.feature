Feature:
    As a behaviour driven developer
    In order to have a DRY, elegant and maintainable test suite
    I want 'gizmo' to do it's funky thing

    Scenario: A user can perform a search from the homepage
        Given a user is on the github homepage
        When the user enters "gizmo" into the search box and clicks the magnifying glass icon
        And the user clicks on the "Advanced search" link
        Then the user is on the "Search" github advanced search page