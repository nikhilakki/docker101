FROM ubuntu:latest

RUN apt-get update 
RUN apt-get install -y python-pip python-dev build-essential

#add source files
COPY . ./app
ENV HOME=/app
WORKDIR /app

# install python dependencies
RUN pip install -r requirements.txt

EXPOSE 5000
CMD [ "gunicorn", "-b", "0.0.0.0:5000","-w", "4", "wsgi:app" ]

