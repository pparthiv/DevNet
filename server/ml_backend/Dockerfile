FROM python:3.12.2

WORKDIR /app

COPY . /app

RUN apt-get -y update

RUN pip install pytest-playwright

RUN pip install "fastapi[all]"

RUN playwright install-deps

RUN playwright install

RUN pip install -r requirements.txt

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]