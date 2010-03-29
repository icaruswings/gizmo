Feature:
    As a behaviour driven developer
    In order to have a DRY, elegant and maintainable test suite
    I want 'gizmo' to do it's funky thing

    Scenario: A scenario performs a github search
        Given the scenario is on the github homepage
        When the scenario enters "gizmo" into the search box
        And the scenario clicks the magnifying glass icon
        And the scenario clicks on the "icaruswings / gizmo" link
        Then the scenario is on the "gizmo" github repository details page
        And the scenario is on a github repository details page which belongs to "icaruswings"