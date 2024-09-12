FROM buildpack-deps:buster

# Instalacja zależności do kompilacji Redis i TCL
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

# Skrypt uruchamiający Redis i testy
CMD ["sh", "-c", "redis-server --daemonize yes && cd /app/tests && tclsh test_helper.tcl"]
