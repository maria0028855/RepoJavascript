pipeline {
    agent any

    stages {
        stage('Install packages') {
            steps {
                sh 'npm install'
                echo 'install packages'
            }
        }
        stage('Test') {
            steps {
                sh 'npm start'
                sh 'sleep 10'
                sh 'curl -k localhost:3000'
                echo 'test'
            }
        }
        stage('Build') {
            steps {
                sh 'npm run build'
                echo 'building'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}

