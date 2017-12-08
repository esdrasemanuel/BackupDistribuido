# Backup Distribuído
 
O script monitora de tempo em tempo, uma pasta com apenas arquivos, havendo modificação em certo arquivo, ele deve ser transferido para os diretórios das máquinas especificadas no arquivo backup.conf. O script também trata a inclusão e a exclusão de arquivos.

Exemplo backup.conf:
```
# <IP>          <USER>      	<PASSWORD>	<DIR>
10.0.0.1        alunoufc       	super122	/home/alunoufc/bkp
10.0.14.54    	root            toor		/tmp/backup
10.0.8.8        jjletho         1234		/home/jjletho/backup
```

### Pré-requisitos

Local: Ter Instalado SSH e SSHPASS
Remoto: Ter Instalado SSH

```
apt-get install openssh-server
```
```
sudo apt-get install sshpass
```


### Instalanção do Script

- 1 - Baixa o arquivo backup.sh e backup.conf
- 2 - Dar permissão de execução para backup.sh e backupOperations.sh:  
```
chmod +x backup.sh
```
```
chmod +x backupOperations.sh
```
- 3 - Editar o arquivo de configuração [backup.conf] com os hosts em que irá manter o backup
- 4 - Executar da seguinte maneira: 
```
./backup.sh -c backup.conf -d [DIRETORIO_MONITORADO] -t [TEMPO_DE_VERIFICACAO_EM_SEGUNDOS]
```
- 5 - Em seguida para cada host contido no backup.conf para os processos no Screen:
```
Ctrl A + D
```
### Autores

* **Calebe Tavares :** [facebook](https://www.facebook.com/calebe.tavares) 
* **Daniel Oliveira :** [facebook](https://www.facebook.com/Daniel.krt500) 
* **Esdras Emanuel :** [facebook](https://www.facebook.com/emanuel.mariano.376)  
* **Matheus Cavalcante :** [facebook](https://www.facebook.com/antoniomatheus.cavalcantedasilva)  
* **Jefferson Severo :** [facebook](https://www.facebook.com/jefferson.severo.16)

### Licença

Licença livre com liberdade de executar, estudar, adaptá-lo e aperfeiçoar e redistribuir seus aperfeiçoamentos, de modo que toda a comunidade possa se beneficiar.

### Referência

https://www.vivaolinux.com.br/dica/sshpass-Passando-senha-como-parametro-no-SSH-e-scp-sem-registro-de-chave-publica
