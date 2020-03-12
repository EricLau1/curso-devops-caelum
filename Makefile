
ssh/web:
	ssh -i infra/ssh-keys/devops vagrant@192.168.50.10

sh 'scp -o StrictHostKeyChecking=no -i /home/vagrant/devops target/alura-forum.war vagrant@192.168.50.10:/home/vagrant/alura-forum.war'
sh "ssh -o StrictHostKeyChecking=no -i /home/vagrant/devops vagrant@192.168.50.10 'sudo mv /home/vagrant/alura-forum.war /var/lib/tomcat8/webapps/alura-forum.war'"