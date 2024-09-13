#!/bin/bash

# Uruchomienie serwera Redis w tle
redis-server &

# Czekanie, aż Redis się uruchomi
sleep 5

# Uruchomienie testów
./runtest --single unit/type/hash-field-expire

# Upewnij się, że Redis zostanie zatrzymany po testach
pkill redis-server
