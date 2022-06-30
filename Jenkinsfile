pipeline{
    agent any
    environment {
       
        registry = "859944870423.dkr.ecr.eu-west-1.amazonaws.com/ssm-workout"
       
        
    }
    stages{


        stage('checkout'{
            checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/KXnarendra/jenkins-test.git']]])

        }


        stage ('Build docker image') {
            steps {
                script {
                dockerImage = docker.build registry + ":$BUILD_NUMBER"
                //dockerImage = docker.build registry + ":$BUILD_NUMBER"

                }
            }
        }

        stage('Docker push') {
            steps{   
                 script {
                         sh 'aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 859944870423.dkr.ecr.eu-west-1.amazonaws.com'
                         sh 'docker push 859944870423.dkr.ecr.eu-west-1.amazonaws.com/ssm-workout:latest'
                        
            }
        }
      }
    }
              #testingg

 }
