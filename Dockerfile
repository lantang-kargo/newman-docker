FROM node:14-slim

RUN apt update && apt install -y \
vim \
git \
awscli \
curl 

ENV NODE_PATH /usr/local/lib/node_modules

RUN npm install -g newman && \
npm install -g newman-reporter-junitxray && \
npm install -g @reportportal/newman-reporter-reportportal && \
npm install -g newman-reporter-json-summary

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
python3 get-pip.py && \
pip install atlassian-python-api

ENTRYPOINT ["newman"]
CMD ["--help"]
