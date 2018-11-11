#! /usr/bin/env groovy

pipeline {
    agent {
        docker {
            image 'node'
            args '-u root'
        }
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building....'
                sh 'npm install'
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
