# Użyj obrazu bazowego z zależnościami
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

# Skopiuj pliki aplikacji do kontenera
COPY . /app

# Jeśli masz jakieś zależności do zainstalowania, zrób to teraz
# RUN pip install -r requirements.txt  # lub inny menedżer pakietów w zależności od języka

# Skrypt do uruchamiania Redis i aplikacji
CMD ["sh", "-c", "redis-server --daemonize yes && ./run_tests.sh"]
