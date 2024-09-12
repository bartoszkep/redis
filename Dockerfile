# Wybór obrazu bazowego
FROM buildpack-deps:buster

# Instalacja zależności
RUN apt-get update && apt-get install -y \
    tcl \
    build-essential \
    autoconf \
    libjemalloc-dev \
    wget

# Pobranie i kompilacja Redis
RUN wget http://download.redis.io/releases/redis-5.0.14.tar.gz && \
    tar xzf redis-5.0.14.tar.gz && \
    cd redis-5.0.14 && \
    make && \
    make install

# Skopiowanie skryptów testowych do obrazu
COPY tests /app/tests

# Ustawienie katalogu roboczego
WORKDIR /app

# Komenda domyślna
CMD ["redis-server"]
