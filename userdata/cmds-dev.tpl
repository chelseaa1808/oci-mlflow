1. Run MLflow dev server:

sudo docker run -it --rm --mount type=bind,source=$HOME/.aws,target=/root/.aws --mount type=bind,source=$HOME/userdata,target=/root/userdata -p 8888:8888 --name mlflow-dev ${region_registry}.ocir.io/${tenancy_name}/${repo_name}/mlflow-dev:0.0.1 /bin/bash

2. Install a certificate for Jupyter Notebook inside the container:

Install a certificate for encrypted communications over HTTPS. To install a self-signed certificate:
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout jupyter-key.key -out jupyter-cert.pem

3. Set the MLFLOW_TRACKING_URI environment variable to tracking server’s URI:

export MLFLOW_TRACKING_URI=http://<tracking.ip>:5000

4. Run jupyter inside the container:

jupyter notebook --ip 0.0.0.0 --no-browser --allow-root --port=8888 --certfile=jupyter-cert.pem --keyfile=jupyter-key.key &

5. Keep Your Container Running In The Background

You have to use two combinations, one after the other: ctrl+p followed by ctrl+q.
