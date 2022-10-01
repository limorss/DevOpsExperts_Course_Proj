FROM python:latest
RUN apt-get -y update
RUN apt-get install -y libnss3
# From https://www.2daygeek.com/install-google-chrome-browser-on-linux/
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -y ./google-chrome-stable_current_amd64.deb
WORKDIR /${COMPOSE_PROJECT_NAME}
COPY *.py /${COMPOSE_PROJECT_NAME}/
COPY requirements.txt /${COMPOSE_PROJECT_NAME}/requirements.txt
COPY Scores.txt /${COMPOSE_PROJECT_NAME}/Scores.txt
RUN pip3 install -r /${COMPOSE_PROJECT_NAME}/requirements.txt
EXPOSE ${PORT}
CMD ["python", "MainScores.py"]
