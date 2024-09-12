FROM buildpack-deps:buster

# Instalacja zależności do kompilacji Redis
RUN apt-get update && apt-get install -y \
    tcl \
    build-essential \
    autoconf \
    libjemalloc-dev \
    docker \
    redis-server

# Utwórz katalog roboczy
WORKDIR /app

# Skopiuj wszystkie pliki aplikacji (w tym katalog tests) do kontenera
COPY . /app

# Skrypt do uruchamiania Redis i aplikacji
CMD ["sh", "-c", "redis-server --daemonize yes && cd /app/tests && ./run_tests.sh"]
