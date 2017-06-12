FROM python:2.7
RUN apt-get update

RUN pip install Cython numpy==1.10.4 scipy==0.17.0 awscli

ADD . /usr/src/code/

ENV PYTHONPATH=/usr/src/code/

WORKDIR /usr/src/code

RUN python setup.py bdist_egg

CMD bash ./docker_code_build_upload/upload_egg_to_s3.sh