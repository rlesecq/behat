# language: en
Feature: RepriseV5Mobile
  @mink:selenium2 @v5mobile
  Scenario Outline: : Reprise de vehicule
    Given I am on "/estimation"
    When I select "<year>" from "Année"
    When I wait for "1" seconds
    When I select "<month>" from "Mois"
    When I wait for "1" seconds
    When I select "<brand>" from "Marque"
    When I wait for "1" seconds
    When I select "<model>" from "Modèle"
    When I wait for "1" seconds
    When I select "<energie>" from "Énergie"
    When I wait for "2" seconds
    When I select "<carrosserie>" from "Carrosserie"
    When I wait for "2" seconds
    When I select "<portes>" from "Nombre de portes"
    When I wait for "2" seconds
    When I select "<motorisation>" from "Motorisation"
    When I wait for "2" seconds
    When I select "<vitesse>" from "Boîte de vitesse"
    When I wait for "2" seconds
    When I select "<finition>" from "Finition"
    When I manually press "#estimation_km" with "<km>"
    When I wait for "2" seconds
    When I press "Estimer"
    When I wait for "2" seconds
    When I fill in "Nom" with "<nom>"
    When I fill in "Prénom" with "<nom>"
    When I fill in "Email" with "<email>"
    When I fill in "Numéro de mobile" with "<phone>"
    When I manually press "#estimation_codepostal" with "<post>"
    When I press "Valider"
    Then I should see "Notre moteur de calcul a relevé"

  Examples:
    | year | month | brand   | model | energie | carrosserie | portes | motorisation  | vitesse        | finition   | km   | nom         | email                  | post  | phone      |
    | 2011 | Mars  | CITROEN | C4    | Diesel  | Berline     | 5      | C4 HDi 90 FAP | Boîte manuelle | Attraction | 2000 | #testaramis | test.aramis@test.fr    | 75011 | 0611111111 |