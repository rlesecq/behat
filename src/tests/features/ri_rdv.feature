Feature: RdvRi
    @mink:selenium2 @rdv @ri
    Scenario Outline: RDV RI
      Given I am on "/rdv"
      When I fill in "Nom" with "<nom>"
      And I fill in "#full_appointment_client_email" with unique email
      And I fill in "Code Postal" with "<post>"
      And I fill in "Téléphone" with "<phone>"
      And I press "Je prends un rendez-vous"
      And I wait for "1" seconds
      And I switch to iframe "agencies_map_iframe"
      And I should see "Votre agence"
      And I press "Choisir cette agence"
      And I switch to parent
      And I wait for "6" seconds
      And I click on "#full_appointment_appointment_intent_1"
      And I wait for "1" seconds
      And I press "Valider le rendez-vous"
      And I wait for "15" seconds
      Then I should see "Votre Rendez-vous"

  Examples:
    | nom     | email                  | post  | phone      |
    | #testar | testaramis.002@test.fr | 75001 | 0111111111 |
