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
docker run builddependencies

./runtest --single unit/type/hash-field-expire
'''
        }

      }
    }

  }
}