#MkDocs need python so I choose latest python image
FROM python:3.8-slim

MAINTAINER Jewel Mohammad Nuruddin
RUN pip install --upgrade pip
RUN pip install mkdocs
WORKDIR  /project-dir

EXPOSE 8000
