pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        script {
          sh 'docker build -t redis-build -f Dockerfile .'
        }

      }
    }

    stage('Test') {
      steps {
        script {
          sh '''
docker run --rm redis-build
'''
        }

      }
    }

    stage('Deploy') {
      steps {
        script {
          sh 'docker build -t redis-deploy -f Dockerfile.deploy .'
        }

      }
    }

  }
}