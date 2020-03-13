pipeline {
    agent any

    stages {

        stage("Limpando a workspace") {
            steps {
                    sh 'pwd'
                    deleteDir()
            }
       }

       stage('Iniciando Deployment') {
           steps {
               script {
                   slackSend(color: '#33A2FF', message: "Iniciando deployment [ALURA FORUM]", channel: 'eric-devops')
                }
           }
       }

       stage("Clonando projeto do github") {
           steps {
               git credentialsId: 'github-ssh', url: "git@github.com:EricLau1/curso-devops-caelum.git"
           }
       }

       stage('Rodar testes unitarios') {
           steps {
               sh "mvn clean test "
           }
       }

       stage('Gerando artefato') {
           steps {
               sh "mvn clean package -DskipTests "
           }
       }

       stage(deploy) {
           steps {
               sh 'scp -o StrictHostKeyChecking=no -i /home/vagrant/devops target/alura-forum.war vagrant@192.168.50.10:/home/vagrant/alura-forum.war'
               sh "ssh -o StrictHostKeyChecking=no -i /home/vagrant/devops vagrant@192.168.50.10 'sudo mv /home/vagrant/alura-forum.war /var/lib/tomcat8/webapps/alura-forum.war'"
           }
       }

        stage('Deployment Finalizado') {
           steps {
               script {
                   slackSend(color: '#56E374', message: "Deployment [ALURA FORUM] finalizado", channel: 'eric-devops')
                }
           }
       }
    }
}