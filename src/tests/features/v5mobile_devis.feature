# language: en
Feature: DevisV5Mobile
  @mink:selenium2 @v5mobile
  Scenario Outline: : Devis de vehicule
    Given I am on "/recherche/marque"
    When I select "<brand>" from "recherche[marque][]"
    When I wait for "1" seconds
    When I select "<model>" from "recherche[modele_libelle][]"
    When I press "Recherchez"
    When I click on "a[id^='offer-id=']"
    When I follow "Devis Gratuit"
    When I fill in "Nom" with "<nom>"
    When I fill in "Email" with "<email>"
    When I fill in "Numéro de mobile" with "<phone>"
    When I manually press "#devis_codepostal" with "<post>"
    When I press "Votre devis gratuit"
    Then I should see "Vous allez bientôt recevoir notre proposition par email"

  Examples:
    |  brand   | model           | nom         | email                  | post  | phone      |
    |  Citroën | Citroën - C4    | #testaramis | test.aramis@test.fr    | 75011 | 0611111111 |