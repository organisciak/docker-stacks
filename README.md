Docker: organisciak/datascience
-------------------------------------

Out of the box quickstart for Python data analysis tools. For convenience, this starts from the SciPy stack and adds my most used additional libraries: Tensorflow (CPU only), NLTK, HTRC Feature Reader.

By default, this runs a Jupyter notebook, on port 8888 inside the container, mapped to whatever port you specify when running.

Usage:

```bash
docker run -p 8888:8888 -e PASSWORD=your_pw -v GEN_CERT=yes -v /your/workspace/directory/:/notebooks organisciak/datascience
```

## Docker compose

`docker-compose.yml` show an example of how you might use docker-compose to save your command line settings.
Set your Jupyter password in `./secrets.env`, and map external:internal directories and ports in `docker-compose.yml`. Then run it with `docker compose up`.
