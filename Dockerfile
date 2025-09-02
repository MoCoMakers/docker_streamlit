FROM python:3.12-bullseye

# hadolint ignore=DL3020
WORKDIR app/

RUN python -m pip install --upgrade pip
RUN python -m pip install -r requirements.txt

# Note: After installation, you need to set up a soft link to the app folder
# The app folder should be linked from a sister git clone: nf_streamlit/app/
# Example command to run after container is built:
# ln -s /path/to/nf_streamlit/app/ /app/app

EXPOSE 8501
CMD ["streamlit", "run", "Home.py"]
