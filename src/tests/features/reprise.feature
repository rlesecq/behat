# language: en
Feature: Reprise
  @mink:selenium2 @reprise @ri
  Scenario Outline: : Reprise de vehicule
    Given I am on "/"
    When I select "<year>" from "vid[year]"
    When I wait for "1" seconds
    When I select "<month>" from "vid[month]"
    When I wait for "1" seconds
    When I select "<brand>" from "vid[make]"
    When I wait for "1" seconds
    When I select "<model>" from "vid[model]"
    When I press "Je commence !"
    When I wait for "1" seconds
    When I select "<energie>" from "vid[fuel_type]"
    When I wait for "2" seconds
    When I select "<carrosserie>" from "vid[body_work]"
    When I wait for "2" seconds
    When I select "<portes>" from "vid[nb_doors]"
    When I wait for "2" seconds
    When I select "<motorisation>" from "vid[engine]"
    When I wait for "2" seconds
    When I select "<vitesse>" from "vid[transmission]"
    When I wait for "2" seconds
    When I select "<finition>" from "vid[model_variant]"
    When I fill in "vid[mileage]" with "<km>"
    When I press "Continuez"
    When I fill in "client_lastname" with "<nom>"
    When I fill in "client_email" with "<email>"
    When I fill in "client_postcode" with "<post>"
    When I fill in "client_phonenumber" with "<phone>"
    When I press "Continuez"
    When I check "Je ne remplace pas ce véhicule ou je l'ai déjà remplacé"
    When I press "Voir l'estimation"
    When I wait for "15" seconds
    Then I should see "Estimation de votre voiture"

  Examples:
    | year | month | brand   | model | energie | carrosserie | portes | motorisation  | vitesse        | finition   | km   | nom     | email                  | post  | phone      |
    | 2011 | Mars  | CITROEN | C4    | Diesel  | Berline     | 5      | C4 HDi 90 FAP | Boîte manuelle | Attraction | 2000 | #testar | testaramis.001@test.fr | 75001 | 0611111111 |
