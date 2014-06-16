# language: en
Feature: Devis
  @mink:selenium2 @deploy @v5
  Scenario Outline: : Creation devis VN
    Given I am on "/"
    When I click on "#voiture_neuve"
    When I wait for "1" seconds
    When I select "<brand>" from "recherche[marque][]"
    When I wait for "1" seconds
    When I select "<model>" from "recherche[modele_libelle][]"
    When I press "Recherchez"
    When I follow "devis gratuit"
    When I select "M" from "client_gender"
    When I fill in "client_name" with "<name>"
    When I fill in "client_email" with "<email>"
    When I fill in "client_tel" with "<tel>"
    When I fill in "client_postalcode" with "<post>"
    When I press "votre devis gratuit"
    Then I should see "Votre devis a été envoyé"

  Examples:
    | brand   | model    | name       | email            | tel           | post  |
    | Renault | Clio 4   | #testbehat | tesbehat@test.fr | 0612345678    | 75001 |
