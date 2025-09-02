FROM python:3.12-bullseye

WORKDIR app/

RUN python -m pip install --upgrade pip
RUN python -m pip install -r requirements.txt

EXPOSE 8501
CMD ["streamlit", "run", "Home.py"]
