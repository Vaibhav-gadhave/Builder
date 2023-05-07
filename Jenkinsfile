pipeline {
  agent any
  environment {
    DOCKERHUB_CREDENTIALS = credentials('Jenkins')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t jenkins-docker-hub .'
        sh 'docker tag jenkins-docker-hub vvgadhave/jenkins-docker'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push vvgadhave/jenkins-docker'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
