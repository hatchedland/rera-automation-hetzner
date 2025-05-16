FROM python:3.9-slim-buster

WORKDIR /app

RUN apt-get update && \
    apt-get install -y nodejs npm
RUN apt-get install -y libglib2.0-0 \
    libnss3 \
    libnspr4 \
    libdbus-1-3 \
    libatk1.0-0 \
    libatspi2.0-0 \
    libx11-6 \
    libxcomposite1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxrandr2 \
    libgbm1 \
    libxcb1 \
    libxkbcommon0 \
    libasound2

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN playwright install

COPY . .

CMD [ "sh", "run-scripts.sh" ]