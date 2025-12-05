FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Standardmäßig den Provider starten. Beim `docker run` kann der Befehl
# überschrieben werden (z. B. `docker run … python consumer.py`).
CMD ["python", "provider.py"]
