# Etap budowy: budowanie i kompilacja Redis
FROM buildpack-deps:buster AS build

# Instalacja zależności do kompilacji Redis
RUN apt-get update && apt-get install -y \
    tcl \
    build-essential \
    autoconf \
    libjemalloc-dev \
    docker

# Pobranie i kompilacja Redis
RUN git clone https://github.com/redis/redis.git /app/redis
WORKDIR /app/redis
RUN make

# Etap końcowy: obraz, który będzie zawierał Redis i testy
FROM buildpack-deps:buster

# Instalacja zależności
RUN apt-get update && apt-get install -y \
    tcl \
    docker \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Kopiowanie skompilowanego Redis oraz testów
COPY --from=build /app/redis/src/redis-server /usr/local/bin/redis-server
COPY --from=build /app/redis/tests /app/tests

# Ustawienie katalogu roboczego
WORKDIR /app/tests

# Uruchomienie Redis i testów w jednym kroku
ENTRYPOINT ["sh", "-c", "redis-server & cd /app/tests && tclsh test_helper.tcl"]
