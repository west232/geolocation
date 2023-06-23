pipeline{
    agent any
    tools{
        maven 'maven'
    }
    environment{
        PATH = "/opt/apache-maven-3.9.2/bin:$PATH"
    }

    stages{
        stage('cloning code'){
            steps{
                git credentialsId: 'jenk', url: 'https://github.com/west232/geolocation.git', branch: 'geo'
            }
        }
        stage('build code'){
            steps{
                sh 'mvn clean install'
            }
        }
    }
}