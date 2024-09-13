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
        script {
          sh '''
            docker run --rm builddependencies
          '''
        }
      }
    }
  }
}
