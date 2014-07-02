# language: en
Feature: Webservices
  @mink:selenium2 @webservices @v5
  Scenario Outline: : Webservice des leads
    Given I am on "/"
    When I go to "creer_fiche_client.php?civilite=M&nom=Violante&prenom=Fabio&codepostal=79000&email=test0107%40adlead.fr&telephone=0321654988&ref_aramis=rv145720&offres_partenaires=1&partenaire=adlead"
    Then I should see "12"