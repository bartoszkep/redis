FROM buildpack-deps:buster

# Instalacja zależności
RUN apt-get update && apt-get install -y \
    tcl \
    build-essential \
    autoconf \
    libjemalloc-dev \
    docker \
    redis-server

# Utwórz katalog roboczy
WORKDIR /app

# Skopiuj wszystkie pliki aplikacji (w tym katalogi tests i support) do kontenera
COPY . /app

# Uruchom Redis i testy
CMD ["sh", "-c", "redis-server --daemonize yes && cd /app/ && make test"]
