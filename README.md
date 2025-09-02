# DigitalOcean-Docker-Streamlit App.

Simple docker streamlit template app to be run on [DigitalOcean](https://m.do.co/c/a42cc842048c) app platform.

## Initial Setup After Git Clone

After cloning this repository, you need to set up a soft link to the app folder from a sister repository:

1. **Clone the nf_streamlit repository** in the same parent directory:
   ```bash
   cd ..
   git clone <nf_streamlit_repo_url> nf_streamlit
   cd docker_streamlit
   ```

2. **Create the soft link** to point to the app folder:
   ```bash
   ln -s ../nf_streamlit/app/ app
   ```

3. **Verify the setup** - your directory should look like this:
   ```bash
   ls -la
   # Should show: app -> ../nf_streamlit/app/
   ```

The final directory structure should be:
```
docker_streamlit/
├── .git/
├── .do/
├── Dockerfile
├── LICENSE
├── README.md
├── run_nfstreamlit.sh
└── app -> ../nf_streamlit/app/  (soft link)
```

**Important:** The `nf_streamlit/app/` directory contains the **live data folder** and should be mounted as a volume when running the container to ensure the application has access to current data.

To deploy you first need to click on "Use this template" and then simply log into your Digital Ocean account and click on "Apps" -> "Launch Your App" -> "Github" and select the corresponding Github repository.

You can use my [referral link](https://m.do.co/c/a42cc842048c) to get $100 worth of credit over 60 days.

[![DigitalOcean Referral Badge](https://web-platforms.sfo2.cdn.digitaloceanspaces.com/WWW/Badge%201.svg)](https://www.digitalocean.com/?refcode=a42cc842048c&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge)


To run locally, try:
```bash
# Build the Docker image (only needs requirements.txt)
docker build . -t streamlit_app
# Run the container with the soft-linked app folder mounted
docker run -p 8501:8501 -v ~/docker_streamlit/app:/app streamlit_app
```

## Production Launch Script

For production deployment, use the included launch script `run_nfstreamlit.sh`:

```bash
# Make the script executable
chmod +x run_nfstreamlit.sh

# Run the container in the background with live data volume
./run_nfstreamlit.sh
```

This script:
- Runs the container in the background using `nohup`
- Mounts the live data folder from `~/nf_streamlit/app` to `/app` in the container
- Ensures the application has access to current data files

Tips for the running updates on the server
```bash
git fetch origin
git merge --ff origin main
docker build . -t streamlit_app
docker run -p 8501:8501 -v ~/docker_streamlit/app:/app streamlit_app
```

**Important Note for Production Deployment:**
The Dockerfile automatically installs requirements from the soft-linked app folder during build. For DigitalOcean App Platform deployment, ensure the soft link is properly set up before building, or use the production launch script for local deployment with live data access.