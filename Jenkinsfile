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
          sh 'docker run -d --name redis-server builddependencies redis-server'

          // Uruchomienie testów
          sh '''
docker run --rm --link redis-server:redis builddependencies /bin/bash -c "
cd /app/tests && tclsh test_helper.tcl"
'''

          // Zatrzymanie Redis
          sh 'docker stop redis-server'
        }

      }
    }

  }
}