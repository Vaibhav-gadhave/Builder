pipeline {
    agent any
    stages {
        stage('Build Docker Images') {
            steps {
                sh 'docker ps'
                sh 'docker build -t vaibhavg/sample1 .'
            }
        }
    }
}
