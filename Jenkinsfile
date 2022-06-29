pipeline{
    agent any
    stages{
        stage('checkout'{
            checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/KXnarendra/jenkins-test.git']]])

        }
    }
}