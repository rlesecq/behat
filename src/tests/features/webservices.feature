# language: en
Feature: Webservices
  @mink:selenium2 @webservices @v5
  Scenario Outline: : Webservice des leads
    Given I am on "/"
    When I go to "creer_fiche_client.php?civilite=M&nom=<name>&prenom=<name>&codepostal=<post>&email=<email>&telephone=<tel>&ref_aramis=<refaramis>&offres_partenaires=1&partenaire=adlead"
    Then I should see "10"

  Examples:
    | refaramis   | partenaire    | name       | email                | tel           | post  |
    | rv145720    | adlead        | #testbehat | test0107%40adlead.fr | 0612345678    | 75001 |
