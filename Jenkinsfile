pipeline{
    agent any
    tools{
        maven 'maven'
    }
    environment{
        PATH = "maven:$PATH"
        dockerimage = ''
        registry = '461228995532.dkr.ecr.us-east-1.amazonaws.com/jenk'
        registryCredential = 'jenk'
        VERSION = "$env.BUILD_ID"
    }


    stages{
        stage('cloning code'){
            steps {
                git credentialsId: 'jenk-github', url: 'https://github.com/west232/geolocation.git', branch: 'geo'
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
      /*   stage("sonar quality check"){   
            agent { docker 'openjdk:11' }
            this  doesn´t work yet*/
        
         /*    steps{
                withSonarQubeEnv('sonar') {
                     'chmod + x mvnw'
                     'mvn clean package sonar:sonar'
               }
            }   
        } */
        /* stage('Build Image') {
            steps {
                script{
                    withCredentials([string(credentialsId: 'docker_pass', variable: 'docker_password')]){
                       sh '''
                          docker build -t 3.84.26.68:8084/springapp:${VERSION} .
                          docker login -u admin -p $docker_password 3.84.26.68:8084
                          #docker push 3.84.26.68:8084/springapp:${VERSION}
                          docker rmi  3.84.26.68:8084/springapp:${VERSION}
                          '''
                    }
                } 
            } 
        } */
       
        stage('build image'){
            steps{
                script{
                    /* dockerImage = docker.build registry */
                    sh 'docker build -t geolocation .'
                    sh echo "docker build success"
                    
                }
            }
        }
        /* this is for practice 
        stage('push image'){
            steps{
                script{
                    sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 461228995532.dkr.ecr.us-east-1.amazonaws.com'
                    sh 'docker tag geolocation:latest 461228995532.dkr.ecr.us-east-1.amazonaws.com/jenk:latest'
                    sh 'docker push 461228995532.dkr.ecr.us-east-1.amazonaws.com/jenk:latest'
                }
            }
        }  
        stage('kubernetes deployment'){
            steps{
                script{
                    sh 'kubectl apply -f deployment.yaml'
                }

            }
            
        }
    
       /*  stage('push image'){
            steps{
                script{
                    sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 461228995532.dkr.ecr.us-east-1.amazonaws.com'
                    sh 'docker push 461228995532.dkr.ecr.us-east-1.amazonaws.com/jenk:latest'
                    sh 'docker rmi 461228995532.dkr.ecr.us-east-1.amazonaws.com/jenk:latest'
                }
            }
        }  */
        

    } 
}

