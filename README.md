# Konfiguracja środowisk OpenPKW

## Diagram Ports&Protocols

![Ports and protocols](https://raw.githubusercontent.com/openpkw/openpkw-devops/master/OpenPKW%20Ports%20and%20Protocols.png)

## Środowiska OpenPKW

![Environments](https://raw.githubusercontent.com/openpkw/openpkw-devops/master/OpenPKW%20Environments.png)

## Sposób testowania skryptów tworzących środowiska OpenPKW
* Zainstalować VirtualBox
* Zainstalować Vagrant
* Do katalogu openpkw-cd/jenkins/.ssh/ wgrać klucz prywatny openpkw-jenkins-cd.pem
* Do katalogu openpkw-kalkulator-wyborczy-web/.ssh/authorized_keys dodać klucz publiczny openpkw-jenkins-cd
* Do katalogu openpkw-dokument-generator/jboss dodać hasło użytkownika managementowego jbossa w pliku jenkins_password
* W poszczególnych katalogach uruchamiać komendę 'vagrant up'

## Lista zadań
* Wszystkie zadania: [Trello](https://trello.com/b/pfN6MeTO/openpkw-kalkulator-obwodowy-web)
