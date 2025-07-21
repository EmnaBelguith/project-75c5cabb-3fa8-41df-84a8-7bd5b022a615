FROM python:3.10-slim-bullseye
WORKDIR /app
COPY . /app/
RUN pip install --no-cache-dir -r /app/flask-main/examples/celery/requirements.txt
RUN pip install gunicorn
EXPOSE 5000
ENV PYTHONUNBUFFERED=1
ENV FLASK_APP=flask-main/src/flask/app.py
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "flask-main.src.flask.app:app"]