FROM python:3.6-alpine

WORKDIR /django-app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .
RUN python manage.py makemigrations 
RUN python manage.py migrate 

CMD [ "python","manage.py","runserver" , "0.0.0.0:8000"]
EXPOSE 8000
