pipeline{
    agent any
    tools{
        maven 'maven'
    }
    environment{
        PATH = "/opt/apache-maven-3.9.2/bin:$PATH"
        dockerimage = ''
        registry = '461228995532.dkr.ecr.us-east-1.amazonaws.com/jenk'
        registryCredential = 'jenk'
    }

    stages{
        stage('cloning code'){
            steps {
                git credentialsId: 'jenk', url: 'https://github.com/west232/geolocation.git', branch: 'geo'
            }
        }
        stage('build code'){
            steps{
                sh 'mvn clean install'
                
            }
        }
        stage('code test'){
            steps {
                sh 'mvn test'
            }
        }
        stage("sonar quality check"){   
            /*agent { docker 'openjdk:11' }
            this  doesn´t work yet*/
        
            steps{
                withSonarQubeEnv('sonar') {
                    /*sh 'chmod + x mvnw'*/
                    sh 'mvn clean package sonar:sonar'
               }
            }   
        }
        /*stage('Build Image') {
            steps {
                script{
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                } 
            }
        }*/
    } 
}