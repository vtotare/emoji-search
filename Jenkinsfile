#! /usr/bin/env groovy

pipeline {
    agent {
        docker {
            image 'node'
            args '-p 3000:3000'
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
                sh 'chmod 755 ./jenkins/scripts/*.sh'
                sh './jenkins/scripts/npmtest.sh'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh './jenkins/scripts/deployment.sh'
                input message: 'Do you want to cancel the process? (Click "Proceed" to continue)'
                sh './jenkins/scripts/terminate.sh'
            }
        }
    }
}
