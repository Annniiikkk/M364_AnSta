## Commands

aws ec2 describe-instances

aws ec2 stop-instances --instance-ids i-06a5f02403aaa1483 

aws ec2 describe-instances --instance-ids i-06a5f02403aaa1483

aws ec2 start-instances --instance-ids i-06a5f02403aaa1483 

aws ec2 run-instances --image-id ami-0866a3c8686eaeeba --count 1 --instance-type t2.micro --key-name anik --security-group-ids sg-02a967c62c3a780de --subnet-id subnet-00c74eaa0af094051 --user-data file://C:\Projects\M364_AnSta\KN09\cloud-init.yaml

telnet 3.89.219.138 3306

mysql -h 3.89.219.138 -u admin -p



## Commands um KN05 mit CLI nachzubauen

### Erstellen eines Subnetzes
aws ec2 create-subnet --vpc-id vpc-0123456789abcdef0 --cidr-block 10.0.1.0/24 --tag-specifications ResourceType=subnet,Tags=[{Key=Name,Value=subnet-kn09}]

### Erstellen einer Security Group
aws ec2 create-security-group --group-name my-security-group --description "My security group" --vpc-id vpc-0123456789abcdef0

### Hinzufügen von Regeln zur Security Group
aws ec2 authorize-security-group-ingress --group-id sg-0123456789abcdef0 --protocol tcp --port 3306 --cidr 0.0.0.0/0

### Instanz erstellen
aws ec2 run-instances --image-id ami-0866a3c8686eaeeba --count 1 --instance-type t2.micro --key-name key1 --security-group-ids sg-02a967c62c3a780de --subnet-id subnet-00c74eaa0af094051 --user-data file://C:\Projects\example\KN09\cloud-init.yaml



## Terraform Commands

### Installiert den Command choco
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

### Installiert terraform
choco install terraform --pre 

### Initialisiren des scripts
terraform init

### Prüfen welche Ressourcen erstellt werden
terraform plan

### Erstellen der Ressourcen
terraform apply


### Verbindung mit telnet testen
telnet 54.165.130.18 3306


### Verbindung mit mysql testen 
mysql -h 54.165.130.18 -u admin -p














