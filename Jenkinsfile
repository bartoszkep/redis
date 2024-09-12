pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        script {
          sh 'docker build -t builddependencies .'
        }

      }
    }

    stage('Test') {
      steps {
        script {
          sh 'docker run --rm builddependencies'
        }

      }
    }

  }
}