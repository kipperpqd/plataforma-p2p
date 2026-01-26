FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copia apenas o necessário para o Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia a pasta backend (onde está seu main.py agora)
COPY backend/ ./backend/

# expoe a porta que o FastAPI usará
EXPOSE 8000

# Ajuste o comando para o novo caminho da pasta
CMD ["python", "backend/main.py"]