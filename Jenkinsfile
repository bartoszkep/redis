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
if [ "$(docker ps -aq -f name=redis-server)" ]; then
docker rm -f redis-server
fi
'''

          // Uruchomienie Redis w tle
          sh 'docker run -d --name redis-server builddependencies redis-server'

          // Uruchomienie testów
          sh '''
docker run --rm --link redis-server:redis builddependencies /bin/bash -c "
cd /app/ && make test"
'''

          // Zatrzymanie Redis (w razie potrzeby, chociaż powinno być już zatrzymane przez usunięcie kontenera)
          sh 'docker stop redis-server || true'
        }

      }
    }

  }
}
