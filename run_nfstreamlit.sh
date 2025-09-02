#!/bin/bash
# Launch script for nf_streamlit Docker container
# This script runs the container in the background with live data volume mount

nohup sudo docker run -p 8501:8501 -v ~/nf_streamlit/app:/app streamlit_app & bg

