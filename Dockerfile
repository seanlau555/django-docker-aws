FROM python:3.7-alpine
ENV PYTHONUNBUFFERED 1
#  Prevents Python from writing pyc files to disc
ENV PYTHONDONTWRITEBYTECODE 1
RUN mkdir /code
WORKDIR /code
# COPY requirements.txt /code/
# RUN pip install -r requirements.txt
# install dependencies
COPY . /code/

RUN pip install --upgrade pip
RUN pip install pipenv
RUN pipenv install --system --deploy

ENTRYPOINT ["python", "pollsapi/manage.py"]
CMD ["runserver", "0.0.0.0:8800"]