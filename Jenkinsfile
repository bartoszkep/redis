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

WORKDIR /app/redis

./runtest --single unit/type/hash-field-expire
'''
        }

      }
    }

  }
}