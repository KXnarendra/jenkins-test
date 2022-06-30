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

        }
    }
