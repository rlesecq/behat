Lancer des tests:
=====

ant behat.run

ant behat.run -Dbehat.tag=”v5”

ant behat.test -Dbehat.feature=”devis.feature”

La liste des tests:
=====

## RI:
- ri_rdv.feature: rendez-vous en ligne
- ri_reprise.feature: reprise

## V5:
- v5_devis_vn.feature: devis vn
- v5_devis_vo.feature: devis vo
- v5_reprise.feature: reprise
- v5_webservices.feature: webservice de création des leads

## V5Mobile:
- v5mobile_devis.feature: devis
- v5mobile_reprise.feature: reprise
