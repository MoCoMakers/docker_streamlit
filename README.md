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
└── app -> ../nf_streamlit/app/  (soft link)
```

To deploy you first need to click on "Use this template" and then simply log into your Digital Ocean account and click on "Apps" -> "Launch Your App" -> "Github" and select the corresponding Github repository.

You can use my [referral link](https://m.do.co/c/a42cc842048c) to get $100 worth of credit over 60 days.

[![DigitalOcean Referral Badge](https://web-platforms.sfo2.cdn.digitaloceanspaces.com/WWW/Badge%201.svg)](https://www.digitalocean.com/?refcode=a42cc842048c&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge)


To run locally, try:
```
docker build . -t streamlit_app
docker run -p 8501:8501 -v ~/docker_streamlit/app:/app streamlit_app
```

Tips for the running updates on the server
```
git fetch origin
git merge --ff origin main
docker build . -t streamlit_app
docker run -p 8501:8501 -v ~/docker_streamlit/app:/app streamlit_app
```

**Important Note for Production Deployment:**
When deploying to your final environment (like DigitalOcean App Platform), you may need to log into the Docker container to manually install requirements if they're not being installed automatically. You can do this by:

1. Accessing your container's shell:
   ```bash
   docker exec -it <container_name> /bin/bash
   ```

2. Installing requirements manually:
   ```bash
   pip install -r requirements.txt
   ```

3. Restarting your application to ensure all dependencies are properly loaded.