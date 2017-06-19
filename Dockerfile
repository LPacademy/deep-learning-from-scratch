FROM python:3.6.1

COPY requirements.txt /tmp/
RUN pip install --no-cache-dir --requirement /tmp/requirements.txt
RUN rm /tmp/requirements.txt

RUN jupyter notebook --generate-config --allow-root && \
    sed -i -e "s/#c.NotebookApp.ip = 'localhost'/c.NotebookApp.ip = '*'/" /root/.jupyter/jupyter_notebook_config.py

COPY . /workspace
WORKDIR /workspace

EXPOSE 8888

CMD ["jupyter", "notebook", "--no-browser", "--allow-root"]
