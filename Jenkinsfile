#! /usr/bin/env groovy

pipeline {
    agent {
        docker {
            image 'node'
            args '-u root'
        }
    }

    environment {
        CI = 'true'
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building....'
                sh 'npm install || exit 1'
            }
        }
        stage('Test') {
                steps {
                    echo 'Testing....'
                    sh 'chmod 755 ./jenkins/scripts/npmtest.sh'
                    sh './jenkins/scripts/npmtest.sh'
                }
       }
    }
}
