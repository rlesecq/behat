# language: en
Feature: Devis
  @mink:selenium2 @v5
  Scenario Outline: : Creation devis VO
    Given I am on "/"
    When I click on "#occasion_controlee"
    When I wait for "1" seconds
    When I select "<brand>" from "recherche[marque][]"
    When I wait for "1" seconds
    When I select "<model>" from "recherche[modele_libelle][]"
    When I press "Recherchez"
    When I follow "Voir l'offre"
    When I click on "#showAppRequest"
    When I select "M" from "client_gender"
    When I fill in "client_name" with "<name>"
    When I fill in "client_email" with "<email>"
    When I fill in "client_tel" with "<tel>"
    When I fill in "client_postalcode" with "<post>"
    When I press "je reçois le dossier"
    Then I should see "VOTRE DEVIS EST EN COURS"

  Examples:
    | brand   | model    | name       | email            | tel           | post  |
    | Renault | Clio 3   | #testbehat | tesbehat@test.fr | 0612345678    | 75001 |