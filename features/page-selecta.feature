Feature: 
      As a behaviour driven developer
      In order to gain dry and elegant cucumber steps
      I want page-selecta to do it's funky thing

Scenario: Page selecta da github search & results mon
  Given the scenario is on the github homepage
  When  the scenario enters "page-selecta" into the search box
  And   the scenario clicks the magnifying glass icon
  And   the scenario clicks on the "icaruswings / page-selecta" link
  Then  the scenario is on the "page-selecta" github repo
  