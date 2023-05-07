pipeline {
  agent any
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t jenkins-docker-hub .'
        sh 'docker tag jenkins-docker-hub vvgadhave/jenkins-docker .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo Passwd@123# | docker login -u vvgadhave --password-stdin'
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
