FROM python:latest
RUN apt-get -y update
RUN apt-get install -y libnss3
# From https://www.2daygeek.com/install-google-chrome-browser-on-linux/
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -y ./google-chrome-stable_current_amd64.deb
WORKDIR /DevOpsExperts_Course_Proj
COPY *.py /DevOpsExperts_Course_Proj/
COPY requirements.txt /DevOpsExperts_Course_Proj/requirements.txt
COPY Scores.txt /DevOpsExperts_Course_Proj/Scores.txt
RUN pip3 install -r /DevOpsExperts_Course_Proj/requirements.txt
EXPOSE 5000
CMD ["python", "MainScores.py"]
