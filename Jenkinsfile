pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t builddependencies .'
      }
    }

    stage('Test') {
      steps {
        sh 'docker run --rm builddependencies'
      }
    }

    stage('Deploy') {
      steps {
        sh 'docker build -t deployable -f Dockerfile.deploy .'
      }
    }

  }
}