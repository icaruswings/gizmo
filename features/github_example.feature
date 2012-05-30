Feature:
    As a behaviour driven developer
    In order to have a DRY, elegant and maintainable test suite
    I want 'gizmo' to do it's funky thing

    Scenario: A user can perform a search from the homepage
        Given I'm on the github homepage
        When I search for "gizmo"
        And I select the "icaruswings / gizmo" repository
        Then I'm taken to the "icaruswings", "gizmo" github repository details page
