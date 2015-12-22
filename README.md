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

## Sposób uruchamiania aplikacji w kontenerach Docker
* Zakładamy, że obraz aplikacji jest zbudowany
* Uruchamiamy kontener: sudo docker run -p <mapping_portów> -d <nazwa_obrazu> tail -f /dev/null
* Kopiujemy id kontenera: sudo docker ps
* Uruchamiamy aplikację w kontenerrze: sudo docker exec CONTAINER_ID <komenda_uruchamiajaca_serwis>

Przykład dla aplikacji openpkw-kalkulator-obwodowy_web:
* sudo docker run -p 80:80 -d openpkw-kalkulator-obwodowy-web tail -f /dev/null
* sudo docker ps
* sudo docker exec CONTAINER_ID sudo service apache2 start

## Lista zadań
* Wszystkie zadania: [Trello](https://trello.com/b/pfN6MeTO/openpkw-kalkulator-obwodowy-web)
