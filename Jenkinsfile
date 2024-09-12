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
        sh 'docker run --rm builddependencies:latest /bin/bash -c "cd /app && ./run_tests.sh"'
      }
    }

  }
}